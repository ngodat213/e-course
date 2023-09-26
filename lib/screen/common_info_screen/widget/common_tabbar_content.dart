import 'package:flutter/material.dart';
import 'package:quiz_flutter/screen/common_info_screen/widget/about_app_tab.dart';
import 'package:quiz_flutter/screen/common_info_screen/widget/contact_us_tab.dart';
import 'package:quiz_flutter/themes/colors.dart';

class CommonTabbarContent extends StatelessWidget {
  const CommonTabbarContent({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        SizedBox(
          height: 1000,
          child: Column(
            children: [
              _CommonTabbar(tabController: _tabController),
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
    );
  }
}

class _CommonTabbar extends StatelessWidget {
  const _CommonTabbar({
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
    );
  }
}
