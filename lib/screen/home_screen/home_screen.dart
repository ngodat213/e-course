import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/home_screen/widget/course_slider.dart';
import 'package:quiz_flutter/screen/home_screen/widget/grid_course.dart';
import 'package:quiz_flutter/screen/home_screen/widget/home_header.dart';
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
      backgroundColor: AppColors.white,
      drawer: const MenuDrawer(),
      appBar: homeAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchView(),
              const CourseSlider(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Dimens.PADDING_SCREEN,
                  vertical: Dimens.PADDING_16,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridViewCourse(),
                    SizedBox(height: Dimens.HEIGHT_20),
                    ListExam(),
                    SizedBox(height: Dimens.HEIGHT_20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      titleSpacing: Dimens.PADDING_SCREEN,
      title: const HomeHeader(),
      iconTheme: const IconThemeData(color: AppColors.label),
      backgroundColor: AppColors.white,
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff1A1C2D),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: Dimens.PADDING_SCREEN, bottom: Dimens.PADDING_33),
                child: ListTile(
                  leading: SvgPicture.asset(
                    Images.iconLogo,
                    color: AppColors.white,
                    height: 32,
                  ),
                  title: Text(S.of(context).app_name,
                      style: TxtStyle.h3.copyWith(color: AppColors.white)),
                ),
              ),
              const MenuDrawerTile(
                svgPath: Images.iconNotification,
                title: 'Notification',
                subtitle: 'Ringtone, message, notification',
              ),
              const MenuDrawerTile(
                svgPath: Images.iconGlobal,
                title: 'Language',
                subtitle: 'English',
              ),
              const MenuDrawerTile(
                svgPath: Images.iconSetting,
                title: 'Preferences',
                subtitle: 'Theme, Settings',
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_6),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/quiz-app-4a98f.appspot.com/o/profileImageeZFxkvClu0e7HL152fnOZmuFYl82?alt=media&token=8babf39b-59d2-4764-b962-104a88c1c1a8')),
                    ),
                  ),
                  trailing: SvgPicture.asset(Images.iconLogout),
                  title: Text(
                    'HydraCoder',
                    style: TxtStyle.inputStyle.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  subtitle: Text(
                    '@ngodat.it213',
                    style: TxtStyle.labelStyle.copyWith(color: Colors.white70),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuDrawerTile extends StatelessWidget {
  const MenuDrawerTile({
    super.key,
    required this.svgPath,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.color,
  });
  final String svgPath;
  final String title;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: AppColors.white.withOpacity(0.05),
          child: SvgPicture.asset(
            svgPath,
            color: AppColors.white,
          )),
      title: Text(
        title,
        style: TxtStyle.inputStyle
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      subtitle: Text(
        subtitle,
        style: TxtStyle.labelStyle.copyWith(color: Colors.white70),
      ),
    );
  }
}
