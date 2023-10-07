import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/user.dart';
import 'package:quiz_flutter/screen/main_screen.dart/cubit/main_cubit.dart';
import 'package:quiz_flutter/screen/profile_screen/cubit/profile_cubit.dart';
import 'package:quiz_flutter/screen/profile_screen/widget/changed_profile.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

class BuildUserSetting extends StatelessWidget {
  const BuildUserSetting({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _displayBottomSheet(
                  context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).username,
                        style: TxtStyle.h3,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).username,
                        hintText: user.displayName!,
                        func: (value) {
                          context.read<ProfileCubit>().userNameChanged(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildButton(
                        text: S.of(context).save,
                        onTap: () {
                          context.read<ProfileCubit>().updateUserName();
                          context.read<MainCubit>().indexChanged(0);
                          BaseNavigation.push(context,
                              routeName: ManagerRoutes.mainScreen);
                          if (state.status == ProfileStatus.success) {
                            toastInfo(msg: 'Update user name successfully!');
                          } else if (state.status == ProfileStatus.error) {
                            toastInfo(msg: 'Update user name fail!');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              child: ChangedProfile(
                title: S.of(context).username,
                text: user.displayName!,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                _displayBottomSheet(
                  context,
                  height: 440,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).email,
                        style: TxtStyle.h3,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).oldEmail,
                        hintText: user.email!,
                        func: (value) {
                          context.read<ProfileCubit>().oldEmailChanged(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).newEmail,
                        hintText: S.of(context).emailExample,
                        func: (value) {
                          context.read<ProfileCubit>().emailChanged(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).password,
                        isPassword: true,
                        hintText: S.of(context).passwordExample,
                        func: (value) {
                          context.read<ProfileCubit>().passwordChanged(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildButton(
                        text: S.of(context).save,
                        onTap: () {
                          context.read<ProfileCubit>().updateEmail();
                          context.read<MainCubit>().indexChanged(0);
                          BaseNavigation.push(context,
                              routeName: ManagerRoutes.mainScreen);
                          if (state.status == ProfileStatus.success) {
                            toastInfo(msg: 'Update email successfully!');
                          } else if (state.status == ProfileStatus.error) {
                            toastInfo(msg: 'Update email fail!');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              child: ChangedProfile(
                title: S.of(context).emailAddress,
                text: user.email!,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                _displayBottomSheet(
                  context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).phoneNumber,
                        style: TxtStyle.h3,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).phoneNumber,
                        hintText: user.phoneNumber!,
                        func: (value) {
                          context
                              .read<ProfileCubit>()
                              .phoneNumberChanged(value);
                        },
                      ),
                      const SizedBox(height: 20),
                      BuildButton(
                        text: S.of(context).save,
                        onTap: () {
                          context.read<ProfileCubit>().updatePhoneNumber();
                          context.read<MainCubit>().indexChanged(0);
                          BaseNavigation.push(context,
                              routeName: ManagerRoutes.mainScreen);
                          if (state.status == ProfileStatus.success) {
                            toastInfo(msg: 'Update phone successfully!');
                          } else if (state.status == ProfileStatus.error) {
                            toastInfo(msg: 'Update phone fail!');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
              child: ChangedProfile(
                title: S.of(context).phoneNumber,
                text: user.phoneNumber!,
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                _displayBottomSheet(
                  context,
                  height: 440,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).resetPassword,
                        style: TxtStyle.h3,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).resetPasswordDescription,
                        style: TxtStyle.text,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                          label: S.of(context).email, hintText: user.email!),
                      const SizedBox(height: 20),
                      BuildTextField(
                          label: S.of(context).password,
                          isPassword: true,
                          hintText: S.of(context).passwordExample),
                      const SizedBox(height: 20),
                      BuildButton(text: S.of(context).send),
                    ],
                  ),
                );
              },
              child: ChangedProfile(
                title: S.of(context).resetPassword,
                text: S.of(context).resetPasswordTitle,
              ),
            ),
          ],
        );
      },
    );
  }
}

Future _displayBottomSheet(BuildContext context,
    {required Widget child, double? height}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    barrierColor: AppColors.grey.withOpacity(0.6),
    isDismissible: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: height ?? 300,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppColors.shadow,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 50,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 50),
              child
            ],
          ),
        ),
      );
    },
  );
}
