import 'package:flutter/material.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/build_button.dart';
import 'package:quiz_flutter/widgets/build_header.dart';
import 'package:quiz_flutter/widgets/build_textfield.dart';
import 'package:quiz_flutter/widgets/login_with_social.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                BuildHeader(
                  text: S.of(context).signUp,
                  title: S.of(context).createYourAccount,
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      BuildTextField(
                        label: S.of(context).name,
                        hintText: 'James Kris',
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).phoneNumber,
                        hintText: S.of(context).enterPhoneNumber,
                        isNumber: true,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).email,
                        hintText: S.of(context).emailExample,
                      ),
                      const SizedBox(height: 20),
                      BuildTextField(
                        label: S.of(context).password,
                        hintText: S.of(context).passwordExample,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 33),
                        child: Text(
                          'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
                          textAlign: TextAlign.center,
                          style: TxtStyle.labelStyle,
                        ),
                      ),
                      const SizedBox(height: 20),
                      BuildButton(text: S.of(context).signUp),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
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
                      const SizedBox(height: 48)
                    ],
                  ),
                )
              ],
            ),
            const BuildBackButton()
          ],
        ),
      ),
    );
  }
}