import 'package:flutter/material.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class AboutAppTab extends StatefulWidget {
  const AboutAppTab({super.key});

  @override
  State<AboutAppTab> createState() => _AboutAppTabState();
}

class _AboutAppTabState extends State<AboutAppTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      child: Column(
        children: [
          const SizedBox(height: Dimens.HEIGHT_30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${S.of(context).appInfo}: ${S.of(context).app_name}",
                style: TxtStyle.text.copyWith(height: 1.5),
              ),
              const SizedBox(height: 10),
              Text(
                "${S.of(context).version}: $VERSION_APP",
                style: TxtStyle.text.copyWith(height: 1.5),
              ),
              const SizedBox(height: 10),
              Text(
                "${S.of(context).for4}: ${S.of(context).iOSAndroid}",
                style: TxtStyle.text.copyWith(height: 1.5),
              ),
              const SizedBox(height: 10),
              Text(
                S.of(context).infoApp,
                style: TxtStyle.text.copyWith(
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
