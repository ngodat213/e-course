import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/course_video/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
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
                        const SizedBox(height: 20),
                        Text(state.course.title, style: TxtStyle.title)
                      ],
                    ),
                  ),
                  TitleScreen(title: state.course.title),
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
