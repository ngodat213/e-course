import 'package:flutter/material.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BuildBottomNavBar extends StatelessWidget {
  const BuildBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 15),
      child: GNav(
        gap: 8,
        backgroundColor: Colors.white,
        color: AppColors.main,
        activeColor: AppColors.main,
        tabBackgroundColor: AppColors.main.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        tabs: const [
          GButton(
            iconSize: 24,
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            iconSize: 24,
            icon: Icons.favorite,
            text: 'Favorite',
          ),
          GButton(
            iconSize: 24,
            icon: Icons.work_outlined,
            text: 'Workshop',
          ),
          GButton(
            iconSize: 24,
            icon: Icons.person,
            text: 'Setting',
          )
        ],
      ),
    );
  }
}
