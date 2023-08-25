// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/sign_in/widget/build_checkbox.dart';
import 'package:quiz_flutter/screen/sign_in/widget/build_forgot_password.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'package:quiz_flutter/widgets/login_with_social.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                BuildHeader(text: S.of(context).login, title: S.of(context).hi),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      BuildTextField(
                        label: S.of(context).email,
                        hintText: S.of(context).emailExample,
                        // func: (value) {
                        //   context.read<SigninBloc>().add(EmailEvent(value));
                        // },
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).password,
                        hintText: S.of(context).passwordExample,
                        isPassword: true,
                        // func: (value) {
                        //   context.read<SigninBloc>().add(PasswordEvent(value));
                        // },
                      ),
                      const _BuildRememberMe(),
                      const SizedBox(height: 20),
                      const _BuildButtonLogin(),
                      const ThirtyPartLogin(),
                      const _BuildSignUp()
                    ],
                  ),
                ),
              ],
            ),
            const BuildBackButton(),
          ],
        ),
      ),
    );
  }
}

class _BuildButtonLogin extends StatelessWidget {
  const _BuildButtonLogin();

  @override
  Widget build(BuildContext context) {
    return BuildButton(
      text: S.of(context).login,
      onTap: () {},
    );
  }
}

class _BuildRememberMe extends StatelessWidget {
  const _BuildRememberMe();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildCheckBox(),
          BuildForgotPassword(),
        ],
      ),
    );
  }
}

class ThirtyPartLogin extends StatelessWidget {
  const ThirtyPartLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                color: Colors.black,
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  S.of(context).loginWith,
                  style: TxtStyle.text,
                ),
              ),
              const Expanded(
                  child: Divider(
                color: Colors.black,
              )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildLoginWithSocial(
              iconPath: Images.iconGoogle,
              text: S.of(context).google,
              onTap: () {},
            ),
            BuildLoginWithSocial(
              iconPath: Images.iconFacebook,
              text: S.of(context).facebook,
              bgColor: AppColors.colorFb,
              textStyle: TxtStyle.buttonWhite,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class _BuildSignUp extends StatelessWidget {
  const _BuildSignUp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).dontHaveAccount,
            style: TxtStyle.text,
          ),
          GestureDetector(
            onTap: () {
              BaseNavigation.push(context,
                  routeName: ManagerRoutes.signUpScreen);
            },
            child: Text(
              S.of(context).signUp,
              style: TxtStyle.textButton,
            ),
          )
        ],
      ),
    );
  }
}
