import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/image_picker.dart';
import 'package:quiz_flutter/widgets/back_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Uint8List? _image;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void selectImage() async {
    Uint8List img = await ImagePickerProfile.pickeImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state.status == SettingStatus.success) {
          final user = state.user;
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: Dimens.PADDING_SCREEN,
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 70),
                          Center(
                            child: Stack(
                              children: [
                                _image != null
                                    ? Container(
                                        width: 106,
                                        height: 106,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: MemoryImage(_image!),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimens.RADIUS_CIRCLE),
                                        ),
                                      )
                                    : Container(
                                        width: 106,
                                        height: 106,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                state.user.photoUrl!),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              Dimens.RADIUS_CIRCLE),
                                        ),
                                      ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      selectImage();
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: AppColors.main,
                                        borderRadius: BorderRadius.circular(
                                            Dimens.RADIUS_CIRCLE),
                                        border: Border.all(
                                            width: 3, color: AppColors.white),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          size: 20,
                                          Icons.camera_alt_rounded,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(user.displayName!, style: TxtStyle.h3),
                          ),
                          const SizedBox(height: 25),
                          ChangedProfile(
                            title: 'Personal Infomation',
                            text: user.displayName!,
                          ),
                          const Divider(),
                          ChangedProfile(
                            title: 'Email Address',
                            text: user.email!,
                          ),
                          const Divider(),
                          ChangedProfile(
                            title: 'Phone number',
                            text: user.phoneNumber!,
                          ),
                          const Divider(),
                          const ChangedProfile(
                            title: 'Reset password',
                            text: 'Send password your email',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Profile Details",
                            style: TxtStyle.buttonBlack,
                          )),
                    ),
                    BuildBackButton(top: 24),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class ChangedProfile extends StatelessWidget {
  const ChangedProfile({
    super.key,
    required this.title,
    required this.text,
  });
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TxtStyle.buttonBlack),
          const Spacer(),
          Text(text, style: TxtStyle.text),
        ],
      ),
    );
  }
}

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 50,
      color: AppColors.grey,
    );
  }
}

class _BuildContentProfile extends StatelessWidget {
  const _BuildContentProfile({
    required this.num,
    required this.text,
  });
  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Text(num.toString(), style: TxtStyle.h2),
          const Spacer(),
          Text(text, style: TxtStyle.labelStyle),
        ],
      ),
    );
  }
}
