import 'package:quiz_flutter/models/models.dart';

abstract class UserBase {
  /*--------------------------------- Profile --------------------------------*/
  Future<User> getProfile();

  Future<void> updateUserName(String value);

  Future<void> updateEmail(String newEmail);

  Future<void> updateEmailCollection(String newEmail);

  Future<void> updatePhoneNumberCollection(String phoneNumber);
}
