import 'package:quiz_flutter/models/models.dart';

abstract class UserBase {
  /*--------------------------------- Profile --------------------------------*/
  Future<User> getProfile();

  Future<List<String>> getCourseUser();

  Future<void> updateUserName(String value);

  Future<void> updateEmail(String newEmail);

  Future<void> updateEmailCollection(String newEmail);

  Future<void> updatePhoneNumberCollection(String phoneNumber);

  Future<void> setCourse(String courseId);

  Future<void> checkFavorite(String courseId);

  Future<bool> checkCourseUserById(String courseId);

  Future<List<String>> getFavoriteCourseUser();
}
