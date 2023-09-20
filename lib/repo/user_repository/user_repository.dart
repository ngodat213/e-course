import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/user_repository/user_base.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

class UserRepository extends UserBase {
  final FirebaseFirestore _firebaseFirestore;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<User> getProfile() async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      final userDoc = await _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .get();
      print(userDoc.toString());
      if (userDoc.exists) {
        return User.fromDoc(userDoc);
      }
      throw ("Lesson is empty!");
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception get Lesson',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
