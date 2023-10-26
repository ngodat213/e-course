import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/change_language/cubit/change_language_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/widget/course_slider.dart';
import 'package:quiz_flutter/screen/home_screen/widget/grid_course.dart';
import 'package:quiz_flutter/screen/home_screen/widget/home_header.dart';
import 'package:quiz_flutter/screen/home_screen/widget/list_exam.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

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
      backgroundColor: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: Dimens.PADDING_SCREEN, bottom: Dimens.PADDING_33),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      Images.iconLogo,
                      height: 32,
                      color: AppColors.main,
                    ),
                    title: Text(S.of(context).app_name, style: TxtStyle.h3),
                  ),
                ),
                MenuDrawerTile(
                  svgPath: Images.iconPerson,
                  title: S.of(context).account,
                  subtitle: S.of(context).accountSetting,
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.profileScreen);
                  },
                ),
                ListTile(
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.courseListScreen);
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: const Icon(
                        Icons.menu_book_rounded,
                        color: AppColors.label,
                      )),
                  title: Text(
                    S.of(context).course,
                    style: TxtStyle.inputStyle
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(S.of(context).yourCourse),
                ),
                MenuDrawerTile(
                  svgPath: Images.iconFavorite,
                  title: S.of(context).myFavorite,
                  subtitle: S.of(context).favoriteCourse,
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.favoriteScreen);
                  },
                ),
                MenuDrawerTile(
                  svgPath: Images.iconGlobal,
                  title: S.of(context).language,
                  subtitle: context
                              .watch<ChangeLanguageCubit>()
                              .state
                              .locale
                              .languageCode ==
                          "vi"
                      ? "Tiếng việt"
                      : "English",
                  onTap: () {
                    BaseNavigation.push(context,
                        routeName: ManagerRoutes.changeLanguage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> DialogLogout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.warning_amber_outlined,
                  color: Color(0xFFEA3434),
                ),
              ),
              Text(
                S.of(context).logout,
                style: TxtStyle.inputStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: Text(S.of(context).logout),
          actions: [
            TextButton(
              onPressed: () {
                BaseNavigation.pop(context);
              },
              child: Text(S.of(context).cancel, style: TxtStyle.text),
            ),
            TextButton(
              onPressed: () {
                BaseSharedPreferences.remove(ManagerKeyStorage.accessToken);
                BaseSharedPreferences.remove(ManagerKeyStorage.keepLogin);
                context.read<SettingCubit>().signOut();
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.signInScreen);
              },
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(AppColors.main),
              ),
              child: Text(S.of(context).logout, style: TxtStyle.p),
            )
          ],
        );
      },
    );
  }
}

class MenuDrawerTile extends StatelessWidget {
  const MenuDrawerTile({
    super.key,
    required this.svgPath,
    required this.subtitle,
    this.title,
    this.onTap,
    this.color,
  });
  final String svgPath;
  final String? title;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.black.withOpacity(0.05),
        child: SvgPicture.asset(
          svgPath,
          width: 20,
        ),
      ),
      title: Text(
        title ?? "",
        style: TxtStyle.inputStyle.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle, style: TxtStyle.labelStyle),
    );
  }
}
