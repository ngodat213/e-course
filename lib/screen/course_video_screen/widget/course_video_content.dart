import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/comment.dart';
import 'package:quiz_flutter/screen/course_video_screen/cubit/course_video_cubit.dart';
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

class CourseVideoContent extends StatelessWidget {
  const CourseVideoContent({
    super.key,
    required this.initializeVideoPlayerFuture,
    required this.videoPlayerController,
    required this.chewieController,
    required this.commentController,
    required this.onPressedSendComment,
  });

  final Future<void> initializeVideoPlayerFuture;
  final VideoPlayerController videoPlayerController;
  final ChewieController chewieController;
  final TextEditingController commentController;
  final Function() onPressedSendComment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseVideoCubit, CourseVideoState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      _videoPlayer(state),
                      const SizedBox(height: 32),
                      _videoTitle(state),
                      _teacherInfo(state),
                      const SizedBox(height: 16),
                      _videoDescription(state, context),
                      const SizedBox(height: 20),
                      _sendComment(context),
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
        );
      },
    );
  }

  ReadMoreText _videoDescription(CourseVideoState state, BuildContext context) {
    return ReadMoreText(
      state.video.description,
      trimLines: 2,
      trimCollapsedText: S.of(context).readmore,
      style: TxtStyle.text.copyWith(color: const Color(0xFF93989A)),
    );
  }

  Row _teacherInfo(CourseVideoState state) {
    return Row(
      children: [
        Text(
          "@${state.course.teacher}",
          style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
        ),
        const SizedBox(width: 4),
        SvgPicture.asset(Images.iconCheckMark),
      ],
    );
  }

  Text _videoTitle(CourseVideoState state) =>
      Text(state.video.title, style: TxtStyle.title);

  FutureBuilder<void> _videoPlayer(CourseVideoState state) {
    return FutureBuilder(
      future: initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            child: AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: Chewie(controller: chewieController),
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
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
          );
        }
      },
    );
  }

  Widget _sendComment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).comment, style: TxtStyle.inputStyle),
        const SizedBox(height: 10),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(context.read<SettingCubit>().state.user.photoUrl!),
          ),
          title: BuildTextField(
            controller: commentController,
            hintText: S.of(context).writeComment,
            func: (value) {
              context.read<CourseVideoCubit>().commentChanged(value);
            },
          ),
          trailing: GestureDetector(
            onTap: () {
              onPressedSendComment.call();
            },
            child: const Icon(Icons.send, color: AppColors.colorFb),
          ),
        ),
      ],
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
          contentPadding: const EdgeInsets.only(top: 5),
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
            trimLength: 80,
            style: TxtStyle.labelStyle.copyWith(color: const Color(0xFF93989A)),
          ),
        ),
      ],
    );
  }
}
