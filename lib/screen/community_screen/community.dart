import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/widgets/search_view.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommunityHeader(),
                SearchView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityHeader extends StatelessWidget {
  const CommunityHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('Community', style: TxtStyle.h2);
  }
}
