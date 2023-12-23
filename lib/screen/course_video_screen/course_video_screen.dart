import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/course_video_screen/cubit/course_video_cubit.dart';
import 'package:quiz_flutter/screen/course_video_screen/widget/course_video_content.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
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
  final TextEditingController _commentController = TextEditingController();

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
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CourseVideoContent(
        initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
        videoPlayerController: _videoPlayerController,
        chewieController: _chewieController,
        commentController: _commentController,
        onPressedSendComment: _onPressedComment,
      ),
    );
  }

  void _onPressedComment() {
    context.read<CourseVideoCubit>().sendCommnet(_commentController.text);
    setState(() {
      context.read<CourseVideoCubit>().getComment();
    });
    _commentController.clear();
  }
}
