import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_flutter/generated/l10n.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/models/course.dart';
import 'package:quiz_flutter/screen/course_detail/cubit/course_detail_cubit.dart';
import 'package:quiz_flutter/screen/home_screen/cubit/home_cubit.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';
import 'package:quiz_flutter/widgets/reusable_menu_text.dart';

class GridViewCourse extends StatefulWidget {
  const GridViewCourse({
    super.key,
  });

  @override
  State<GridViewCourse> createState() => _GridViewCourseState();
}

class _GridViewCourseState extends State<GridViewCourse> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        List<Course> courses = state.courses;
        if (state.status == HomeStatus.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(height: Dimens.HEIGHT_8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).choiceYourCourse, style: TxtStyle.title),
                  GestureDetector(
                    onTap: () {
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.courseListScreen);
                    },
                    child: Text(S.of(context).all, style: TxtStyle.pMainColor),
                  ),
                ],
              ),
              Row(
                children: [
                  ReusableMenuText(S.of(context).all),
                  ReusableMenuText(S.of(context).cpp),
                  ReusableMenuText(S.of(context).python),
                  ReusableMenuText(S.of(context).cs),
                ],
              ),
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
                  (context, index) => GestureDetector(
                    onTap: () {
                      context
                          .read<CourseDetailCubit>()
                          .courseChanged(courses[index]);
                      BaseNavigation.push(context,
                          routeName: ManagerRoutes.courseDetailScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.PADDING_12,
                          vertical: Dimens.PADDING_8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(courses[index].thumb),
                            fit: BoxFit.cover),
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(courses[index].title, style: TxtStyle.textWhite),
                          Text('Hydra', style: TxtStyle.p),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state.status == HomeStatus.isLoading) {
          return GridView.custom(
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
              (context, index) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.PADDING_12, vertical: Dimens.PADDING_8),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(Dimens.RADIUS_8),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
