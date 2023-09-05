import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
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
                Text('My Course', style: TxtStyle.h2),
                const Coupe(),
                const _courseContinute(),
                const _courseContinute(),
                const _courseContinute(),
                const _courseContinute()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _courseContinute extends StatelessWidget {
  const _courseContinute();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Flutter for begginer', style: TxtStyle.title),
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                    ),
                  ),
                  Text('HydraCoder', style: TxtStyle.labelStyle)
                ],
              ),
              const Spacer(),
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
          )
        ],
      ),
    );
  }
}

class Coupe extends StatelessWidget {
  const Coupe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
    );
  }
}
