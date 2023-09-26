import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/home_screen/widget/card_course.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';

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
    return Column(
      children: [
        CarouselSlider(
          items: const [CardSlider(), CardSlider(), CardSlider()],
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
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_5))),
          ),
        ),
      ],
    );
  }
}
