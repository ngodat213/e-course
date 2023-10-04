import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({super.key});

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
          SettingTile(
            svgPath: Images.iconPerson,
            text: 'Account',
            subtitle: 'Account setting',
            iconColor: AppColors.label,
            onTap: () {
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.profileScreen);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconGlobal,
            text: 'Language',
            subtitle: 'English',
            onTap: () {
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.changeLanguage);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconInfo,
            text: 'About',
            subtitle: 'About us',
            onTap: () {
              context.read<CommoInfoCubit>().indexChanged(0);
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.commoInfoScreen);
            },
          ),
          const _CustomDivider(),
          SettingTile(
            svgPath: Images.iconChat,
            text: 'Help',
            subtitle: 'Contact us',
            onTap: () {
              context.read<CommoInfoCubit>().indexChanged(1);
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.commoInfoScreen);
            },
          ),
          const _CustomDivider(),
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

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.svgPath,
    required this.text,
    required this.subtitle,
    this.iconColor,
    this.onTap,
    this.color,
  });
  final Color? iconColor;
  final String svgPath;
  final String text;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0),
          child: SvgPicture.asset(
            svgPath,
            color: iconColor,
            width: 24,
          ),
        ),
        title: Text(
          text,
          style: TxtStyle.inputStyle
              .copyWith(fontWeight: FontWeight.w600, color: color),
        ),
        subtitle: Text(
          subtitle,
          style: TxtStyle.labelStyle.copyWith(color: color),
        ),
      ),
    );
  }
}
