import 'package:flutter/material.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/themes/colors.dart';
import 'package:quiz_flutter/themes/dimens.dart';
import 'package:quiz_flutter/themes/text_styles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const AccountUser(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: const Divider(height: 1, color: AppColors.grey),
                ),
                const BuildTile(
                  icon: Icons.person_outline,
                  color: AppColors.main,
                  text: 'Personal data',
                ),
                const BuildTile(
                  icon: Icons.dark_mode_outlined,
                  color: AppColors.colorTw,
                  text: 'Dark mode',
                ),
                const BuildTile(
                  icon: Icons.settings_outlined,
                  color: AppColors.orage,
                  text: 'Setting',
                ),
                const BuildTile(
                  icon: Icons.credit_card,
                  color: AppColors.emerald,
                  text: 'Payment',
                ),
                const BuildTile(
                  icon: Icons.favorite_border,
                  color: Colors.pink,
                  text: 'Refferal code',
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Divider(height: 1, color: AppColors.grey),
                ),
                const BuildTile(
                  icon: Icons.info_outline,
                  color: AppColors.input,
                  text: 'FAQs',
                ),
                const BuildTile(
                  icon: Icons.textsms_outlined,
                  color: AppColors.input,
                  text: 'Community',
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Divider(height: 1, color: AppColors.grey),
                ),
                const BuildTile(
                  icon: Icons.login_outlined,
                  color: AppColors.main,
                  text: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTile extends StatelessWidget {
  const BuildTile({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });
  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.main.withOpacity(0.09),
          borderRadius: BorderRadius.circular(Dimens.RADIUS_18),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(text, style: TxtStyle.inputStyle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.input,
        size: 16,
      ),
    );
  }
}

class AccountUser extends StatelessWidget {
  const AccountUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: NetworkImage(DEFAULT_AVATAR),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hydra Coder', style: TxtStyle.title),
            Text('ngodat.it213@gmail.com', style: TxtStyle.labelStyle)
          ],
        )
      ],
    );
  }
}
