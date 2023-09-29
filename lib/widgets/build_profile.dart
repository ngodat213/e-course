import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class BuildProfile extends StatelessWidget {
  const BuildProfile({
    this.color,
    super.key,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BaseNavigation.push(context,
                routeName: ManagerRoutes.profileScreen);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(state.user.photoUrl!)),
            title: Text(state.user.displayName!,
                style: TxtStyle.h3.copyWith(color: color ?? AppColors.white)),
            subtitle: Text(state.user.email!,
                style: TxtStyle.labelStyle
                    .copyWith(color: color ?? AppColors.white)),
          ),
        );
      },
    );
  }
}
