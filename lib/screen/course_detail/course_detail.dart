import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
<<<<<<< Updated upstream
=======
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';
import 'package:readmore/readmore.dart';
>>>>>>> Stashed changes

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => CourseDetailScreenState();
}

<<<<<<< Updated upstream
class CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 242,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                  ),
                ),
                const Row(
                  children: [
                    Text('HydraCoder'),
                    Spacer(),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Icon(Icons.star, size: 14, color: AppColors.star),
                    Text('5.0'),
                  ],
                ),
                Text('Flutter for begginer', style: TxtStyle.h2),
                Row(
                  children: [
                    Text('11h11 / 18 Lesson', style: TxtStyle.labelStyle),
                    const SizedBox(width: 18),
                    Text('\$ 111,11', style: TxtStyle.labelMain),
                    Text(' / ', style: TxtStyle.labelStyle),
                    Text('\$ 999,99', style: TxtStyle.lineThrough),
                  ],
                ),
                Text('About This Course', style: TxtStyle.title)
              ],
            ),
          ),
        ),
      ),
=======
class CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<CourseDetailCubit>().getCourseLesson();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailCubit, CourseDetailState>(
      builder: (context, state) {
        final course = state.course;
        context.read<CourseVideoCubit>().courseChanged(course);
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
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(course.thumb),
                              fit: BoxFit.cover,
                            ),
                            color: AppColors.main,
                            borderRadius:
                                BorderRadius.circular(Dimens.RADIUS_8),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(course.title, style: TxtStyle.h3),
                        _typeWidget(course),
                        const SizedBox(height: 16),
                        ReadMoreText(
                          course.description,
                          trimLines: 2,
                          style: TxtStyle.text
                              .copyWith(color: const Color(0xFF93989A)),
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
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
                  Positioned(
                    top: 24,
                    right: 25,
                    child: GestureDetector(
                      onTap: () {
                        context.read<CourseDetailCubit>().updateFavorite();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          boxShadow: AppColors.shadow,
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset(
                          Images.iconFavorite,
                          color: (state.favorite == true
                              ? Colors.red
                              : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  TitleScreen(title: course.title),
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

class _typeWidget extends StatelessWidget {
  const _typeWidget(this.course);
  final Course course;

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
            Text(course.ratting.toString(), style: TxtStyle.rating),
            const SizedBox(width: 4),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            SvgPicture.asset(Images.iconStar, width: 12),
            const SizedBox(width: 4),
            Text("(${course.register})", style: TxtStyle.labelStyle),
          ],
        ),
      ],
>>>>>>> Stashed changes
    );
  }
}
