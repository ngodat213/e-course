import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/home/widget/bottom_nav.dart';
import 'package:quiz_flutter/screen/home/widget/exam_done.dart';
import 'package:quiz_flutter/screen/home/widget/list_exam.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

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
      bottomNavigationBar: const BuildBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Row(
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
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  boxShadow: AppColors.shadow,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 17),
                    prefixIcon: const Icon(Icons.search),
                    hintText: S.of(context).searchTitle,
                    hintStyle: TxtStyle.hintStyle,
                    border: InputBorder.none,
                  ),
                ),
              ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
    );
  }
}
