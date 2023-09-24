import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/search_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Page page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCourse();
    context.read<HomeCubit>().getQuiz();
    context.read<SettingCubit>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(
                  Dimens.PADDING_SCREEN,
                  Dimens.PADDING_18,
                  Dimens.PADDING_SCREEN,
                  Dimens.PADDING_ZERO,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    const SearchView(),
                    Text('${S.of(context).hi}, HydraCoder',
                        style: TxtStyle.title),
                    const SizedBox(height: Dimens.HEIGHT_8),
                    Text(S.of(context).progressTitle,
                        style: TxtStyle.hintStyle),
                  ],
                ),
              ),
              const CourseSlider(),
              Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  decorator: DotsDecorator(
                      color: AppColors.grey,
                      activeColor: AppColors.main,
                      size: const Size.square(Dimens.SIZE_5),
                      activeSize: const Size(Dimens.HEIGHT_20, Dimens.HEIGHT_5),
                      activeShape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimens.RADIUS_5))),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: Dimens.PADDING_SCREEN,
                    vertical: Dimens.PADDING_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Dimens.HEIGHT_8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).choiceYourCourse,
                            style: TxtStyle.title),
                        Text(S.of(context).all, style: TxtStyle.pMainColor),
                      ],
                    ),
                    Row(
                      children: [
                        _reusableMenuText(S.of(context).all),
                        _reusableMenuText(S.of(context).cpp),
                        _reusableMenuText(S.of(context).python),
                        _reusableMenuText(S.of(context).cs),
                      ],
                    ),
                    const GridCourse(),
                    const SizedBox(height: Dimens.HEIGHT_20),
                    const ListExam(),
                    const SizedBox(height: Dimens.HEIGHT_20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GridCourse extends StatefulWidget {
  const GridCourse({
    super.key,
  });

  @override
  State<GridCourse> createState() => _GridCourseState();
}

class _GridCourseState extends State<GridCourse> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<Course> courses = state.courses;
        if (state.status == HomeStatus.isNotEmpty) {
          return GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) => GestureDetector(
                onTap: () {
                  context
                      .read<CourseDetailCubit>()
                      .courseChanged(courses[index]);
                  BaseNavigation.push(context,
                      routeName: ManagerRoutes.courseDetailScreen);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.PADDING_12,
                      vertical: Dimens.PADDING_8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(courses[index].thumb),
                        fit: BoxFit.cover),
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(courses[index].title, style: TxtStyle.textWhite),
                      Text('Hydra', style: TxtStyle.p),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state.status == HomeStatus.isLoading) {
          return GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.PADDING_12, vertical: Dimens.PADDING_8),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _reusableMenuText extends StatelessWidget {
  const _reusableMenuText(
    this.text,
  );
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          right: Dimens.PADDING_12,
          top: Dimens.PADDING_18,
          bottom: Dimens.PADDING_18),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.PADDING_20, vertical: Dimens.PADDING_6),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Text(text, style: TxtStyle.p),
    );
  }
}

class CourseSlider extends StatefulWidget {
  const CourseSlider({
    super.key,
  });

  @override
  State<CourseSlider> createState() => _CourseSliderState();
}

class _CourseSliderState extends State<CourseSlider> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [CardSlider(), CardSlider(), CardSlider()],
      carouselController: carouselController,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        viewportFraction: 1,
        onPageChanged: (index, reason) {},
      ),
    );
  }
}

class CardSlider extends StatelessWidget {
  const CardSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: Dimens.HEIGHT_150,
      margin: const EdgeInsets.only(
          top: Dimens.PADDING_18,
          left: Dimens.PADDING_SCREEN,
          right: Dimens.PADDING_SCREEN),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              Images.imageCourse0,
              height: Dimens.HEIGHT_150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.PADDING_16,
              vertical: Dimens.PADDING_16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hydra', style: TxtStyle.p),
                const SizedBox(height: Dimens.HEIGHT_25),
                SizedBox(
                  width: Dimens.HEIGHT_200,
                  child:
                      Text('Flutter for begginer', style: TxtStyle.titleWhite),
                ),
                Text('20/25 ${S.of(context).lesson}', style: TxtStyle.p),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(Images.iconMenu, width: Dimens.HEIGHT_16),
            Expanded(child: Container()),
            const Icon(Icons.notifications_none_sharp),
            GestureDetector(
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.profileScreen);
              },
              child: Container(
                width: Dimens.HEIGHT_32,
                height: Dimens.HEIGHT_32,
                margin: const EdgeInsets.only(left: Dimens.PADDING_16),
                child: CircleAvatar(
                  radius: Dimens.RADIUS_CIRCLE,
                  backgroundImage: NetworkImage(state.user.photoUrl!),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
