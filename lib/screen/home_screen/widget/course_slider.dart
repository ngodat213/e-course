import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_course.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _courseSliderTitle(),
            CarouselSlider(
              items: state.courses
                  .map((e) => GestureDetector(
                      onTap: () {
                        context.read<CourseDetailCubit>().courseChanged(e);
                        BaseNavigation.push(context,
                            routeName: ManagerRoutes.courseDetailScreen);
                      },
                      child: CardSlider(e)))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  context.read<HomeCubit>().sliderIndexChanged(index);
                },
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 4,
                position: context.read<HomeCubit>().state.sliderIndex,
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
            ),
          ],
        );
      },
    );
  }
}

class _courseSliderTitle extends StatelessWidget {
  const _courseSliderTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_SCREEN),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${S.of(context).hi}, ${state.user.displayName}',
                  style: TxtStyle.title),
              const SizedBox(height: Dimens.HEIGHT_8),
              Text(S.of(context).progressTitle, style: TxtStyle.hintStyle),
            ],
          ),
        );
      },
    );
  }
}
