import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/favorite_screen/cubit/favorite_screen_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/back_button.dart';
import 'package:quiz_flutter/widgets/course_card_listview.dart';
import 'package:quiz_flutter/widgets/title_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    context.read<FavoriteScreenCubit>().getFavoriteCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteScreenCubit, FavoriteScreenState>(
      builder: (context, state) {
        if (state.status == FavoriteScreenStatus.isNotEmpty) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: Dimens.PADDING_SCREEN),
                      child: Column(
                        children: [
                          const SizedBox(height: 70),
                          state.courses.isEmpty
                              ? Column(
                                  children: [
                                    const SizedBox(height: 70),
                                    Center(
                                      child: Image.asset(
                                        Images.imageNothing,
                                        width: 200,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Nothing\nMy Favorite is empty.",
                                      style: TxtStyle.h2,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: state.courses.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<CourseDetailCubit>()
                                            .courseChanged(
                                                state.courses[index]);
                                        context
                                            .read<CourseDetailCubit>()
                                            .isFullChanged(true);
                                        BaseNavigation.push(context,
                                            routeName: ManagerRoutes
                                                .courseDetailScreen);
                                      },
                                      child: CourseCardListView(
                                          state.courses[index]),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                    const TitleScreen(title: 'My Favorite'),
                    BuildBackButton(top: 24),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
