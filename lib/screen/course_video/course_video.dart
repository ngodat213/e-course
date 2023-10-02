import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
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
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(context.read<CourseVideoCubit>().state.videoUrl));
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 11,
        autoPlay: true,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(child: Text(errorMessage, style: TxtStyle.p));
        });
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
                        Text(state.title, style: TxtStyle.title),
                        Row(
                          children: [
                            Text(
                              "@mftmkkus",
                              style: TxtStyle.pBold
                                  .copyWith(color: const Color(0xFF93989A)),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset(Images.iconCheckMark),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ReadMoreText(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          trimLines: 2,
                          style: TxtStyle.text
                              .copyWith(color: const Color(0xFF93989A)),
                        ),
                        const SizedBox(height: 20),
                        Text('Comment', style: TxtStyle.inputStyle),
                        const SizedBox(height: 10),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(DEFAULT_AVATAR),
                          ),
                          title: BuildTextField(hintText: 'Write a comment...'),
                          trailing: const Icon(Icons.send),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return const UserComment();
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  TitleScreen(title: state.section),
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

class UserComment extends StatelessWidget {
  const UserComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(top: 16),
          leading:
              const CircleAvatar(backgroundImage: NetworkImage(DEFAULT_AVATAR)),
          title: Text(
            'HydraCoder',
            style: TxtStyle.hintStyle,
          ),
          subtitle: Column(
            children: [
              ReadMoreText(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                trimLength: 192,
                style: TxtStyle.labelStyle
                    .copyWith(color: const Color(0xFF93989A)),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(
                    Icons.thumb_up_outlined,
                    size: 16,
                  ),
                  SizedBox(width: 8),
                  Text('10'),
                  SizedBox(width: 20),
                  Icon(
                    Icons.comment_outlined,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
