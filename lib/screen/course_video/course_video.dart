import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/comment.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class CourseVideoScreen extends StatefulWidget {
  const CourseVideoScreen({super.key});

  @override
  State<CourseVideoScreen> createState() => CourseVideoScreenState();
}

class CourseVideoScreenState extends State<CourseVideoScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    initVideoPlayer();
    context.read<CourseVideoCubit>().getComment();
  }

  void initVideoPlayer() {
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(context.read<CourseVideoCubit>().state.video.video));
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 11,
      autoPlay: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(child: Text(errorMessage, style: TxtStyle.p));
      },
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseVideoCubit, CourseVideoState>(
      builder: (context, state) {
        print("Selection : ${state.selection}, ${state.video.title}");
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Dimens.RADIUS_8),
                                child: AspectRatio(
                                  aspectRatio:
                                      _videoPlayerController.value.aspectRatio,
                                  child: Chewie(controller: _chewieController),
                                ),
                              );
                            } else {
                              return Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width - 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(state.course.thumb),
                                    fit: BoxFit.cover,
                                  ),
                                  color: AppColors.main,
                                  borderRadius:
                                      BorderRadius.circular(Dimens.RADIUS_8),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        Text(state.video.title, style: TxtStyle.title),
                        Row(
                          children: [
                            Text(
                              "@${state.course.teacher}",
                              style: TxtStyle.pBold
                                  .copyWith(color: const Color(0xFF93989A)),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(Images.iconCheckMark),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ReadMoreText(
                          state.video.description,
                          trimLines: 2,
                          trimCollapsedText: S.of(context).readmore,
                          style: TxtStyle.text
                              .copyWith(color: const Color(0xFF93989A)),
                        ),
                        const SizedBox(height: 20),
                        Text(S.of(context).comment, style: TxtStyle.inputStyle),
                        const SizedBox(height: 10),
                        const SendComment(),
                        const ShowComment(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  TitleScreen(title: state.selection),
                  BuildBackButton(top: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowComment extends StatelessWidget {
  const ShowComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseVideoCubit, CourseVideoState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.comments.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return UserComment(comment: state.comments[index]);
          },
        );
      },
    );
  }
}

class SendComment extends StatefulWidget {
  const SendComment({
    super.key,
  });

  @override
  State<SendComment> createState() => _SendCommentState();
}

TextEditingController _textEditingController = TextEditingController();

class _SendCommentState extends State<SendComment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseVideoCubit, CourseVideoState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(context.read<SettingCubit>().state.user.photoUrl!),
          ),
          title: BuildTextField(
            controller: _textEditingController,
            hintText: S.of(context).writeComment,
            func: (value) {
              context.read<CourseVideoCubit>().commentChanged(value);
            },
          ),
          trailing: GestureDetector(
            onTap: () {
              _textEditingController.clear();
              context.read<CourseVideoCubit>().sendCommnet();
              setState(() {
                context.read<CourseVideoCubit>().getComment();
              });
            },
            child: const Icon(Icons.send, color: AppColors.colorFb),
          ),
        );
      },
    );
  }
}

class UserComment extends StatefulWidget {
  const UserComment({
    super.key,
    required this.comment,
  });
  final Comment comment;

  @override
  State<UserComment> createState() => _UserCommentState();
}

class _UserCommentState extends State<UserComment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 16),
          leading: FutureBuilder<String?>(
            future: context
                .read<CourseVideoCubit>()
                .getPhotoUrlById(widget.comment.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data != null) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(snapshot.data!),
                );
              } else {
                return const CircleAvatar();
              }
            },
          ),
          title: FutureBuilder<String?>(
            future: context
                .read<CourseVideoCubit>()
                .getUsernameById(widget.comment.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData && snapshot.data != null) {
                return Text(snapshot.data!, style: TxtStyle.hintStyle);
              } else {
                return const Text("");
              }
            },
          ),
          subtitle: ReadMoreText(
            widget.comment.title,
            textAlign: TextAlign.start,
            trimLength: 192,
            style: TxtStyle.labelStyle.copyWith(color: const Color(0xFF93989A)),
          ),
        ),
      ],
    );
  }
}
