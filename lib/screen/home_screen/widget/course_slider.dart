import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_course.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CourseSlider extends StatefulWidget {
  const CourseSlider({
    super.key,
    required this.course,
  });
  final List<Course> course;

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
              items: widget.course.map((e) => CardSlider(e)).toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {},
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_SCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${S.of(context).hi}, HydraCoder', style: TxtStyle.title),
          const SizedBox(height: Dimens.HEIGHT_8),
          Text(S.of(context).progressTitle, style: TxtStyle.hintStyle),
        ],
      ),
    );
  }
}
