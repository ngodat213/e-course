import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/screen/common_info_screen/cubit/commo_info_cubit.dart';
import 'package:quiz_flutter/screen/common_info_screen/widget/common_tabbar_content.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

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
                  CommonTabbarContent(tabController: _tabController),
                  TitleScreen(title: S.of(context).commonInfo),
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
