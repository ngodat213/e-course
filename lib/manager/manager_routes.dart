part of 'manager_path_routes.dart';

class ManagerRoutes {
  ManagerRoutes._();

  static String splashScreen = '/';
  static String signInScreen = '/sign_in';
  static String signUpScreen = '/sign_up';
  static String forgotPasswordScreen = '/forgot_password';
  static String mainScreen = '/main_screen';
  static String homeScreen = '/home_screen';
  static String favoriteScreen = '/favorite_screen';
  static String communityScreen = '/community_screen';
  static String settingScreen = '/setting_screen';
  static String courseDetailScreen = '/course_detail';
  static String quizScreen = '/detail_screen';
  static String quizPlayScreen = '/quiz_play_screen';
  static String commoInfoScreen = '/commo_info_screen';
  static String profileScreen = '/profile_screen';
  static String editProfileScreen = '/edit_profile_screen';

  static Map<String, Widget Function(BuildContext context)> manager = {
    splashScreen: (context) => const SplashScreen(),
    signInScreen: (context) => const SignInScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    forgotPasswordScreen: (context) => const ForgotPasswordScreen(),
    mainScreen: (context) => const MainScreen(),
    homeScreen: (context) => const HomeScreen(),
    favoriteScreen: (context) => const FavoriteScreen(),
    communityScreen: (context) => const CommunityScreen(),
    settingScreen: (context) => const SettingScreen(),
    courseDetailScreen: (context) => const CourseDetailScreen(),
    quizScreen: (context) => const QuizScreen(),
    quizPlayScreen: (context) => const QuizPlayScreen(),
    commoInfoScreen: (context) => const CommoInfoScreen(),
    profileScreen: (context) => const ProfileScreen(),
  };
}
