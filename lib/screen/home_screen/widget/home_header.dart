import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_flutter/manager/manager_path_routes.dart';
import 'package:quiz_flutter/screen/setting_screen/cubit/setting_cubit.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/images.dart';
import 'package:quiz_flutter/utils/base_navigation.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(Images.iconMenu, width: Dimens.HEIGHT_16),
            Expanded(child: Container()),
            const Icon(Icons.notifications_none_sharp),
            GestureDetector(
              onTap: () {
                BaseNavigation.push(context,
                    routeName: ManagerRoutes.profileScreen);
              },
              child: Container(
                width: Dimens.HEIGHT_32,
                height: Dimens.HEIGHT_32,
                margin: const EdgeInsets.only(left: Dimens.PADDING_16),
                child: CircleAvatar(
                  radius: Dimens.RADIUS_CIRCLE,
                  backgroundImage: NetworkImage(state.user.photoUrl!),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
