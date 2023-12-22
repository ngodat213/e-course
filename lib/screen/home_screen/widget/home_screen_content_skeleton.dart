import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/widgets/skeleton_widget.dart';

class HomeScreenContentSkeleton extends StatelessWidget {
  const HomeScreenContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimens.PADDING_SCREEN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton(
            width: 80,
          ),
          const SizedBox(height: 8),
          const Skeleton(
            width: 120,
          ),
          const SizedBox(height: 18),
          Skeleton(
            width: MediaQuery.of(context).size.width,
            height: Dimens.HEIGHT_180,
          ),
          const SizedBox(height: 21),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(width: 80),
              Skeleton(width: 32),
            ],
          ),
          const SizedBox(height: 8),
          GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.6,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 4,
              (context, index) => const Skeleton(),
            ),
          ),
          const SizedBox(height: Dimens.HEIGHT_20),
          const Skeleton(
            width: 80,
          ),
          const SizedBox(height: 8),
          const Skeleton(
            width: 120,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: Dimens.HEIGHT_200,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Skeleton(
                      width: Dimens.HEIGHT_160, height: Dimens.HEIGHT_200),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
