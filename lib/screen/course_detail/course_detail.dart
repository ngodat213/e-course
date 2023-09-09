import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_review.dart';
import 'package:quiz_flutter/screen/course_detail/widget/tab_lesson.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:readmore/readmore.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

class CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text('Flutter for begginer', style: TxtStyle.h3),
                    const _typeWidget(),
                    const SizedBox(height: 16),
                    ReadMoreText(
                      'Murakami.Flowers is a work in which artist Takashi Murakami’s representative artwork, flowers, are expressed as dot art evocative of Japanese TV games created in the 1970s. The work is being developed with the number 108 as the keyword; a combination of 108 backgrounds and flower colors make up a field, and there are 108 fields. Each field has 108 flower images, resulting in 11,664 flower images in total. The number 108 is a reference to bonnō, or earthly temptations.',
                      trimLines: 2,
                      style: TxtStyle.text
                          .copyWith(color: const Color(0xFF93989A)),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 500,
                      child: Column(
                        children: [
                          TabBar(
                            unselectedLabelColor: AppColors.label,
                            labelColor: Colors.black,
                            indicatorColor: AppColors.white,
                            indicator: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.main,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Lesson'),
                              Tab(text: 'Review'),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                TabLesson(),
                                TabReview(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Flutter for begginer',
                      style: TxtStyle.buttonBlack,
                    )),
              ),
              BuildBackButton(top: 24)
            ],
          ),
        ),
      ),
    );
  }
}

class _typeWidget extends StatelessWidget {
  const _typeWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "@mftmkkus",
              style: TxtStyle.pBold.copyWith(color: const Color(0xFF93989A)),
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(Images.iconCheckMark),
          ],
        ),
        Row(
          children: [
            Text('4.8', style: TxtStyle.rating),
            const SizedBox(width: 4),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            const SizedBox(width: 4),
            Text("(234)", style: TxtStyle.labelStyle),
          ],
        )
      ],
    );
  }
}
