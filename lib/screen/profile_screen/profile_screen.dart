import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/profile_screen/widget/user_setting.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/image_picker.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

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
    Uint8List img = await ImagePickerProfile.pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    await ImagePickerProfile.uploadImage();
    setState(() {
      context.read<SettingCubit>().handleGetUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        if (state.status == SettingStatus.success) {
          final user = state.user;
          return Scaffold(
            backgroundColor: AppColors.white,
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
                          _ChangedAvatar(state),
                          const SizedBox(height: 12),
                          Center(
                            child: Text(user.displayName!, style: TxtStyle.h3),
                          ),
                          const SizedBox(height: 25),
                          BuildUserSetting(user: user),
                        ],
                      ),
                    ),
                    TitleScreen(title: S.of(context).profileDetail),
                    BuildBackButton(top: 24),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Center _ChangedAvatar(SettingState state) {
    return Center(
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
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                  ),
                )
              : Container(
                  width: 106,
                  height: 106,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.user.photoUrl!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
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
                  borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                  border: Border.all(width: 3, color: AppColors.white),
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
    );
  }
}
