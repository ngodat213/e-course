import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36),
                    ProfileUser(),
                    _SettingMenu(),
                    _Logout(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logout extends StatelessWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const BuildTile(
        svgPath: Images.iconLogout,
        text: 'Notification',
        description: 'Log out the account',
        color: Color(0xFFEA3434),
      ),
    );
  }
}

class _SettingMenu extends StatelessWidget {
  const _SettingMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(width: 4, color: Color(0xFFF6F6F6)),
        ),
      ),
      child: Column(
        children: [
          const BuildTile(
            svgPath: Images.iconNotification,
            text: 'Notification',
            description: 'Ringtone, message, notification',
          ),
          const _CustomDivider(),
          const BuildTile(
            svgPath: Images.iconGlobal,
            text: 'Language',
            description: 'English',
          ),
          const _CustomDivider(),
          BuildTile(
            svgPath: Images.iconInfo,
            text: 'About',
            description: 'About us',
            onTap: () {
              context.read<CommoInfoCubit>().indexChanged(0);
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.commoInfoScreen);
            },
          ),
          const _CustomDivider(),
          BuildTile(
            svgPath: Images.iconChat,
            text: 'Help',
            description: 'Contact us',
            onTap: () {
              context.read<CommoInfoCubit>().indexChanged(1);
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.commoInfoScreen);
            },
          ),
          const _CustomDivider(),
          const BuildTile(
            svgPath: Images.iconSetting,
            text: 'Preferences',
            description: 'Theme, Settings',
          ),
        ],
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(height: 1, color: AppColors.grey);
  }
}

class BuildTile extends StatelessWidget {
  const BuildTile({
    super.key,
    required this.svgPath,
    required this.text,
    required this.description,
    this.onTap,
    this.color,
  });
  final String svgPath;
  final String text;
  final String description;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(svgPath),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: TxtStyle.inputStyle.copyWith(
                        fontWeight: FontWeight.w600, color: color ?? color)),
                Text(description, style: TxtStyle.labelStyle)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      height: 99,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 23,
              backgroundImage: NetworkImage(DEFAULT_AVATAR),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hydra Coder', style: TxtStyle.h3),
              const Spacer(),
              Text('ngodat.it213@gmail.com', style: TxtStyle.labelStyle),
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                    border:
                        Border.all(width: 1, color: const Color(0xFFEDEDED))),
                child: Text('Edit profile', style: TxtStyle.inputStyle),
              )
            ],
          )
        ],
      ),
    );
  }
}
