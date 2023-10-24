import 'package:flutter/material.dart';
import 'package:quiz_flutter/widgets/body_item_asset.dart';

class ItemLanguage extends StatelessWidget {
  const ItemLanguage({
    Key? key,
    this.assetName,
    this.nameLang,
    this.style,
    this.onTap,
    this.iconChecked,
  }) : super(key: key);

  final String? assetName, nameLang;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Widget? iconChecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyItemAsset(
          onTap: onTap,
          assetName: assetName!,
          mid: Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: SizedBox(width: 200, child: Text(nameLang!, style: style)),
          ),
          height: 16,
          radius: 2,
          widthImg: 24,
          right: iconChecked!,
        ),
        const SizedBox(height: 16),
        const Divider(),
      ],
    );
  }
}
