import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/models/language.dart';
import 'package:quiz_flutter/screen/change_language/cubit/change_language_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/items_language.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  List<Language> langData = [
    Language(
        urlIcon:
            'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1280px-Flag_of_the_United_States.svg.png',
        title: 'English'),
    Language(
        urlIcon:
            'https://static.wikia.nocookie.net/doraemon/images/a/a2/1599px-Flag_of_Vietnam.svg.png/revision/latest/scale-to-width-down/1599?cb=20200120095413&path-prefix=en',
        title: 'Vietnamese')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlocBuilder<ChangeLanguageCubit,
                          ChangeLanguageState>(
                        builder: (context, state) {
                          final selectedIndex = context.select(
                              (ChangeLanguageCubit bloc) => bloc.state.index);
                          return ItemLanguage(
                            onTap: () => context
                                .read<ChangeLanguageCubit>()
                                .changeLang(index),
                            assetName: langData[index].urlIcon,
                            nameLang: langData[index].title,
                            iconChecked: selectedIndex == index
                                ? SvgPicture.asset(
                                    Images.iconCheck,
                                    width: 16,
                                    color: AppColors.main,
                                  )
                                : const Text(''),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            TitleScreen(title: S.of(context).changeLanguage),
            BuildBackButton(top: 24),
          ],
        )),
      ),
    );
  }
}
