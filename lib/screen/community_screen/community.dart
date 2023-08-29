import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
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
              children: [
                CommunityHeader(),
                SearchView(),
                ChatBox(),
                ChatBox(),
                ChatBox(),
                ChatBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                    image: const DecorationImage(
                        image: NetworkImage(DEFAULT_AVATAR), fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: AppColors.white),
                      color: AppColors.emerald,
                      borderRadius: BorderRadius.circular(Dimens.RADIUS_CIRCLE),
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CatMeo", style: TxtStyle.buttonBlack),
              const Spacer(),
              Row(
                children: [
                  Text("Nó ăn mì cay!!", style: TxtStyle.textMsg),
                  Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text('1m ago', style: TxtStyle.textMsg)),
                ],
              ),
            ],
          )
        ],
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
    return Row(
      children: [
        Text('Community', style: TxtStyle.h2),
        Expanded(child: Container()),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: AppColors.colorGpt,
              borderRadius: BorderRadius.circular(Dimens.RADIUS_8)),
          child: SvgPicture.asset(
            Images.iconGptLogo,
            color: AppColors.white,
            width: 20,
          ),
        ),
        Text('ChatGPT', style: TxtStyle.text),
      ],
    );
  }
}
