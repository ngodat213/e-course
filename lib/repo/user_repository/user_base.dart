import 'package:firebase_auth/firebase_auth.dart';

abstract class UserBase {
  /*--------------------------------- Profile --------------------------------*/
  Future<User> getProfile({required String uid});
}
