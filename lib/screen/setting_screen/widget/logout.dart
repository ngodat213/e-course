import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/screen/setting_screen/widget/setting_menu.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SettingTile(
        svgPath: Images.iconLogout,
        text: 'Sign out',
        subtitle: 'Sign out the account',
        color: const Color(0xFFEA3434),
        onTap: () {
          showDialog(
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
                      'Log out',
                      style: TxtStyle.inputStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: const Text('Do you wanna sign out'),
                actions: [
                  TextButton(
                    onPressed: () {
                      BaseNavigation.pop(context);
                    },
                    child: Text("Cancel", style: TxtStyle.text),
                  ),
                  TextButton(
                    onPressed: () {
                      BaseSharedPreferences.remove(
                          ManagerKeyStorage.accessToken);
                      BaseSharedPreferences.remove(ManagerKeyStorage.keepLogin);
                      context.read<SettingCubit>().signOut();
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.signInScreen);
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(AppColors.main),
                    ),
                    child: Text("Sign out", style: TxtStyle.p),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
