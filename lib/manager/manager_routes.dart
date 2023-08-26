part of 'manager_path_routes.dart';

class ManagerRoutes {
  ManagerRoutes._();

  static String splashScreen = '/';
  static String signInScreen = '/sign_in';
  static String signUpScreen = '/sign_up';
  static String forgotPasswordScreen = '/forgot_password';
  static String onboardingScreen = '/onboarding_screen';
  static String homeScreen = '/home';

  static Map<String, Widget Function(BuildContext context)> manager = {
    splashScreen: (context) => const SplashScreen(),
    signUpScreen: (context) => const SignUpScreen(),
    signInScreen: (context) => const SignInScreen(),
    homeScreen: (context) => const HomeScreen(),
  };
}
