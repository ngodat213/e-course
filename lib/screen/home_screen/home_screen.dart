import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/screen/home_screen/widget/exam_done.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                const SearchView(),
                Text('Hi, HydraCoder', style: TxtStyle.title),
                const SizedBox(height: 8),
                Text('Here you progress last week', style: TxtStyle.hintStyle),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  margin: const EdgeInsetsDirectional.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text('Your beat of 95% of the other student',
                              style: TxtStyle.titleWhite),
                        ),
                        Expanded(child: Container()),
                        Text('Read more', style: TxtStyle.linkText)
                      ],
                    ),
                  ),
                ),
                const ListExam(),
                Text('Last exam done', style: TxtStyle.title),
                const ExamDone()
              ],
            ),
          ),
        ),
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
        SvgPicture.asset(Images.iconBell, width: 16),
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
