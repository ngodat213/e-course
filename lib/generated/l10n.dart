// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `E-Course`
  String get app_name {
    return Intl.message(
      'E-Course',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Hi, Welcome back!`
  String get hiTitle {
    return Intl.message(
      'Hi, Welcome back!',
      name: 'hiTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordAnswer {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordAnswer',
      desc: '',
      args: [],
    );
  }

  /// `or log in with`
  String get loginWith {
    return Intl.message(
      'or log in with',
      name: 'loginWith',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `xyz@example.com`
  String get emailExample {
    return Intl.message(
      'xyz@example.com',
      name: 'emailExample',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get passwordExample {
    return Intl.message(
      '********',
      name: 'passwordExample',
      desc: '',
      args: [],
    );
  }

  /// `Let’s create your account!`
  String get createYourAccount {
    return Intl.message(
      'Let’s create your account!',
      name: 'createYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `You’ll get a message soon on your e-mail address`
  String get forgotPasswordTitle {
    return Intl.message(
      'You’ll get a message soon on your e-mail address',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Populra Destination`
  String get popularDestination {
    return Intl.message(
      'Populra Destination',
      name: 'popularDestination',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app`
  String get terms {
    return Intl.message(
      'By tapping sign up you agree to the Terms and Condition and Privacy Policy of this app',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `Last exam done`
  String get lastExamDone {
    return Intl.message(
      'Last exam done',
      name: 'lastExamDone',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message(
      'Remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Question`
  String get question {
    return Intl.message(
      'Question',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message(
      'Course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Search course, exam test`
  String get searchTitle {
    return Intl.message(
      'Search course, exam test',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to E-Course`
  String get progressTitle {
    return Intl.message(
      'Welcome to E-Course',
      name: 'progressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Populra Course`
  String get populraCourse {
    return Intl.message(
      'Populra Course',
      name: 'populraCourse',
      desc: '',
      args: [],
    );
  }

  /// `Today test`
  String get todayTest {
    return Intl.message(
      'Today test',
      name: 'todayTest',
      desc: '',
      args: [],
    );
  }

  /// `Here you test list for today`
  String get todayTestTitle {
    return Intl.message(
      'Here you test list for today',
      name: 'todayTestTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lesson`
  String get lesson {
    return Intl.message(
      'Lesson',
      name: 'lesson',
      desc: '',
      args: [],
    );
  }

  /// `Readmore`
  String get readmore {
    return Intl.message(
      'Readmore',
      name: 'readmore',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Selection`
  String get selection {
    return Intl.message(
      'Selection',
      name: 'selection',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get hour {
    return Intl.message(
      'hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message(
      'min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Your course`
  String get yourCourse {
    return Intl.message(
      'Your course',
      name: 'yourCourse',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Course`
  String get favoriteCourse {
    return Intl.message(
      'Favorite Course',
      name: 'favoriteCourse',
      desc: '',
      args: [],
    );
  }

  /// `Commnet`
  String get comment {
    return Intl.message(
      'Commnet',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment...`
  String get commentTitle {
    return Intl.message(
      'Write a comment...',
      name: 'commentTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `AboutUs`
  String get aboutUs {
    return Intl.message(
      'AboutUs',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Topic`
  String get topic {
    return Intl.message(
      'Topic',
      name: 'topic',
      desc: '',
      args: [],
    );
  }

  /// `Topic of Message`
  String get topicInfo {
    return Intl.message(
      'Topic of Message',
      name: 'topicInfo',
      desc: '',
      args: [],
    );
  }

  /// `Text`
  String get text {
    return Intl.message(
      'Text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `Submit Message`
  String get summitMessage {
    return Intl.message(
      'Submit Message',
      name: 'summitMessage',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment....`
  String get writeComment {
    return Intl.message(
      'Write a comment....',
      name: 'writeComment',
      desc: '',
      args: [],
    );
  }

  /// `Application information`
  String get appInfo {
    return Intl.message(
      'Application information',
      name: 'appInfo',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `For`
  String get for4 {
    return Intl.message(
      'For',
      name: 'for4',
      desc: '',
      args: [],
    );
  }

  /// `iOS and Android`
  String get iOSAndroid {
    return Intl.message(
      'iOS and Android',
      name: 'iOSAndroid',
      desc: '',
      args: [],
    );
  }

  /// `Introduce`
  String get introduce {
    return Intl.message(
      'Introduce',
      name: 'introduce',
      desc: '',
      args: [],
    );
  }

  /// `Section`
  String get section {
    return Intl.message(
      'Section',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `ChangeLanguage`
  String get changeLanguage {
    return Intl.message(
      'ChangeLanguage',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get resetPassword {
    return Intl.message(
      'Reset password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send your email to reset your password`
  String get resetPasswordTitle {
    return Intl.message(
      'Send your email to reset your password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile Details`
  String get profileDetail {
    return Intl.message(
      'Profile Details',
      name: 'profileDetail',
      desc: '',
      args: [],
    );
  }

  /// `Account setting`
  String get accountSetting {
    return Intl.message(
      'Account setting',
      name: 'accountSetting',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `My favorite`
  String get myFavorite {
    return Intl.message(
      'My favorite',
      name: 'myFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Course favorite`
  String get courseFavorite {
    return Intl.message(
      'Course favorite',
      name: 'courseFavorite',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Do you wanna sign out`
  String get wannaSignOut {
    return Intl.message(
      'Do you wanna sign out',
      name: 'wannaSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Sign out the account`
  String get logOutTitle {
    return Intl.message(
      'Sign out the account',
      name: 'logOutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Old email`
  String get oldEmail {
    return Intl.message(
      'Old email',
      name: 'oldEmail',
      desc: '',
      args: [],
    );
  }

  /// `New email`
  String get newEmail {
    return Intl.message(
      'New email',
      name: 'newEmail',
      desc: '',
      args: [],
    );
  }

  /// `Common Info`
  String get commonInfo {
    return Intl.message(
      'Common Info',
      name: 'commonInfo',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email associated with your account and well send and email with instructions to reset your password`
  String get resetPasswordDescription {
    return Intl.message(
      'Enter the email associated with your account and well send and email with instructions to reset your password',
      name: 'resetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `The E-Course application is a powerful learning support tool, developed by Flutter, making it easy to manage learning materials, study time, and optimize your learning process. This is an application that supports students, students and anyone who wants to improve their learning performance and manage knowledge effectively. The E-Course application is a reliable friend in supporting your learning process. Download application today and experience convenience and effectiveness in learning management.`
  String get infoApp {
    return Intl.message(
      'The E-Course application is a powerful learning support tool, developed by Flutter, making it easy to manage learning materials, study time, and optimize your learning process. This is an application that supports students, students and anyone who wants to improve their learning performance and manage knowledge effectively. The E-Course application is a reliable friend in supporting your learning process. Download application today and experience convenience and effectiveness in learning management.',
      name: 'infoApp',
      desc: '',
      args: [],
    );
  }

  /// `Username updated successfully`
  String get toastUsername {
    return Intl.message(
      'Username updated successfully',
      name: 'toastUsername',
      desc: '',
      args: [],
    );
  }

  /// `Username update failed!`
  String get toastUsernameFail {
    return Intl.message(
      'Username update failed!',
      name: 'toastUsernameFail',
      desc: '',
      args: [],
    );
  }

  /// `Fill in all text fields`
  String get fillAll {
    return Intl.message(
      'Fill in all text fields',
      name: 'fillAll',
      desc: '',
      args: [],
    );
  }

  /// `Go Home`
  String get goHome {
    return Intl.message(
      'Go Home',
      name: 'goHome',
      desc: '',
      args: [],
    );
  }

  /// `Check result`
  String get checkResult {
    return Intl.message(
      'Check result',
      name: 'checkResult',
      desc: '',
      args: [],
    );
  }

  /// `Your result`
  String get yourResult {
    return Intl.message(
      'Your result',
      name: 'yourResult',
      desc: '',
      args: [],
    );
  }

  /// `Correct`
  String get correct {
    return Intl.message(
      'Correct',
      name: 'correct',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get fail {
    return Intl.message(
      'Fail',
      name: 'fail',
      desc: '',
      args: [],
    );
  }

  /// `Point`
  String get point {
    return Intl.message(
      'Point',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get showless {
    return Intl.message(
      'Show less',
      name: 'showless',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
