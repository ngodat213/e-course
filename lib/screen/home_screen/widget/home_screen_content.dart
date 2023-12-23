import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_course.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_exam.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/skeleton_widget.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({
    super.key,
    required this.carouselController,
    required this.homeCubit,
    required this.settingCubit,
    required this.onPressedCourse,
    required this.onPressedExam,
    required this.onPressedCourseList,
  });
  final HomeCubit homeCubit;
  final SettingCubit settingCubit;
  final CarouselController carouselController;
  final Function(Quiz quiz) onPressedExam;
  final Function(Course course) onPressedCourse;
  final Function() onPressedCourseList;

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    widget.homeCubit.handleGetCourse();
    widget.homeCubit.handleGetQuiz();
    widget.settingCubit.handleGetUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _welcomeUser(widget.settingCubit.state.user),
                _courseSilder(
                  state.courses,
                  widget.carouselController,
                ),
                _dotIndicator(state.sliderIndex),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: Dimens.PADDING_SCREEN,
                    vertical: Dimens.PADDING_16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _gridviewCourseTitle(context),
                      _gridviewCourse(context, state.courses),
                      _listExams(context, state.quizs),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listExams(BuildContext context, List<Quiz> quizs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimens.HEIGHT_20),
        Text(S.of(context).todayTest, style: TxtStyle.title),
        const SizedBox(height: Dimens.HEIGHT_8),
        Text(S.of(context).todayTestTitle, style: TxtStyle.hintStyle),
        const SizedBox(height: Dimens.HEIGHT_8),
        SizedBox(
          height: Dimens.HEIGHT_200,
          child: ListView.builder(
            itemCount: quizs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  widget.onPressedExam.call(quizs[index]);
                },
                child: CardExam(
                  quiz: quizs[index],
                  image: 'lib/res/images/read_image$index.svg',
                ),
              );
            },
          ),
        ),
        const SizedBox(height: Dimens.HEIGHT_20),
      ],
    );
  }

  Column _gridviewCourse(BuildContext context, List<Course> courses) {
    return Column(
      children: [
        const SizedBox(height: Dimens.HEIGHT_8),
        GridView.custom(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.6,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: courses.length < 4 ? courses.length : 4,
            (context, index) => GestureDetector(
              onTap: () {
                widget.onPressedCourse.call(courses[index]);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Dimens.RADIUS_8)),
                    child: Image.network(
                      courses[index].thumb,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Skeleton(radius: Dimens.RADIUS_8);
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Skeleton(radius: Dimens.RADIUS_8);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.PADDING_12,
                        vertical: Dimens.PADDING_8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(courses[index].title, style: TxtStyle.textWhite),
                        Text('Hydra', style: TxtStyle.p),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _gridviewCourseTitle(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimens.HEIGHT_8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(S.of(context).populraCourse, style: TxtStyle.title),
            GestureDetector(
              onTap: () {
                widget.onPressedCourseList.call();
              },
              child: Text(S.of(context).all, style: TxtStyle.pMainColor),
            ),
          ],
        ),
      ],
    );
  }

  Widget _courseSilder(List<Course> courses, CarouselController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items: courses
              .map((e) => GestureDetector(
                  onTap: () {
                    widget.onPressedCourse.call(e);
                  },
                  child: CardSlider(e)))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              context.read<HomeCubit>().sliderIndexChanged(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _dotIndicator(int index) {
    return Center(
      child: DotsIndicator(
        dotsCount: 4,
        position: index,
        decorator: DotsDecorator(
          color: AppColors.grey,
          activeColor: AppColors.main,
          size: const Size.square(Dimens.SIZE_5),
          activeSize: const Size(Dimens.HEIGHT_20, Dimens.HEIGHT_5),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.RADIUS_5),
          ),
        ),
      ),
    );
  }

  Widget _welcomeUser(User user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_SCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${S.of(context).hi}, ${user.displayName}',
              style: TxtStyle.title),
          const SizedBox(height: Dimens.HEIGHT_8),
          Text(S.of(context).progressTitle, style: TxtStyle.hintStyle),
        ],
      ),
    );
  }
}
