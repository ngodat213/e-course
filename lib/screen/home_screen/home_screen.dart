import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/repo/app_repository.dart/app_repository.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/exam_done.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(appRepository: context.read<AppRepository>()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 18, 25, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeHeader(),
                      const SearchView(),
                      Text('Hi, HydraCoder', style: TxtStyle.title),
                      const SizedBox(height: 8),
                      Text('Here you progress last week',
                          style: TxtStyle.hintStyle),
                    ],
                  ),
                ),
                const CourseContinue(),
                Center(
                  child: DotsIndicator(
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        color: AppColors.grey,
                        activeColor: AppColors.main,
                        size: const Size.square(5),
                        activeSize: const Size(20, 5),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Choice your course', style: TxtStyle.title),
                          Text('All', style: TxtStyle.pMainColor),
                        ],
                      ),
                      const Row(
                        children: [
                          _reusableMenuText('All'),
                          _reusableMenuText("Math"),
                          _reusableMenuText('Hacker'),
                        ],
                      ),
                      GridView.custom(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: 4,
                          (context, index) => GestureDetector(
                            onTap: () {
                              BaseNavigation.push(context,
                                  routeName: ManagerRoutes.courseDetailScreen);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.main,
                                borderRadius:
                                    BorderRadius.circular(Dimens.RADIUS_8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Flutter for begginer',
                                      style: TxtStyle.textWhite),
                                  Text('Hydra', style: TxtStyle.p),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const ListExam(),
                      const SizedBox(height: 20),
                      Text('Last exam done', style: TxtStyle.title),
                      const SizedBox(height: 8),
                      const ExamDone(),
                      const ExamDone(),
                      const ExamDone()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
      margin: const EdgeInsets.only(right: 12, top: 18, bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Text(text, style: TxtStyle.p),
    );
  }
}

class CourseContinue extends StatefulWidget {
  const CourseContinue({
    super.key,
  });

  @override
  State<CourseContinue> createState() => _CourseContinueState();
}

class _CourseContinueState extends State<CourseContinue> {
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: const [
        CardSliderContinue(),
        CardSliderContinue(),
        CardSliderContinue()
      ],
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

class CardSliderContinue extends StatelessWidget {
  const CardSliderContinue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      margin: const EdgeInsets.only(top: 18, left: 25, right: 25),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              Images.imageCourse,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hydra', style: TxtStyle.p),
                const SizedBox(height: 25),
                SizedBox(
                  width: 200,
                  child:
                      Text('Flutter for begginer', style: TxtStyle.titleWhite),
                ),
                Text('20/25 Lesson', style: TxtStyle.p),
                Expanded(child: Container()),
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(
                    color: AppColors.colorTw,
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TxtStyle.pBold,
                    ),
                  ),
                )
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
    return Row(
      children: [
        SvgPicture.asset(Images.iconMenu, width: 16),
        Expanded(child: Container()),
        const Icon(Icons.notifications_none_sharp),
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(left: 16),
          child: const CircleAvatar(
            radius: Dimens.RADIUS_CIRCLE,
            backgroundImage: NetworkImage(DEFAULT_AVATAR),
          ),
        ),
      ],
    );
  }
}
