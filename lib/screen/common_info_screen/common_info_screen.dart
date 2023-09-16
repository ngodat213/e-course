import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/screen/common_info_screen/widget/about_app_tab.dart';
import 'package:quiz_flutter/screen/common_info_screen/widget/contact_us_tab.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/back_button.dart';

class CommoInfoScreen extends StatefulWidget {
  const CommoInfoScreen({super.key});

  @override
  State<CommoInfoScreen> createState() => _CommoInfoScreenState();
}

class _CommoInfoScreenState extends State<CommoInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: context.read<CommoInfoCubit>().state.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommoInfoCubit, CommoInfoState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 60),
                      SizedBox(
                        height: 1000,
                        child: Column(
                          children: [
                            TabBar(
                              unselectedLabelColor: AppColors.label,
                              labelColor: Colors.black,
                              indicatorColor: AppColors.white,
                              indicator: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.main,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              controller: _tabController,
                              tabs: const [
                                Tab(text: 'About us'),
                                Tab(text: 'Contact us'),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: const [
                                  AboutAppTab(),
                                  ContactUsTab(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Common info",
                          style: TxtStyle.buttonBlack,
                        )),
                  ),
                  BuildBackButton(top: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
