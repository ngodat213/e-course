import 'package:quiz_flutter/models/models.dart';

abstract class UserBase {
  /*--------------------------------- Profile --------------------------------*/
  Future<User> getProfile();
}
