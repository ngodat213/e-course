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
