import 'package:flutter/material.dart';
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
          Text(
            'Discover this 4.8-km out-and-back trail near Estes Park, Colorado. Generally considered an easy route, it takes an average of 1 h 34 min to complete. This is a very popular area for hiking and snowshoeing, so you\'ll likely encounter other people while exploring. The trail is open year-round and is beautiful to visit anytime. You\'ll need to leave pups at home — dogs aren\'t allowed on this trail.\n\nDiscover this 4.8-km out-and-back trail near Estes Park, Colorado. Generally considered an easy route, it takes an average of 1 h 34 min to complete. This is a very popular area for hiking and snowshoeing, so you\'ll likely encounter other people while exploring.',
            style: TxtStyle.text
                .copyWith(color: const Color(0xFF93989A), height: 1.5),
          ),
        ],
      ),
    );
  }
}
