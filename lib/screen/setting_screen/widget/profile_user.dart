import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BaseNavigation.push(context,
                routeName: ManagerRoutes.profileScreen);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: 38,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(state.user.photoUrl!),
                    backgroundColor: AppColors.white,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.user.displayName!, style: TxtStyle.h3),
                    const Spacer(),
                    Text(state.user.email!, style: TxtStyle.labelStyle),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
