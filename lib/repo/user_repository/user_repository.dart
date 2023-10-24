import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/models/models.dart';
import 'package:quiz_flutter/repo/user_repository/user_base.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';

class UserRepository extends UserBase {
  final FirebaseFirestore _firebaseFirestore;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  UserRepository({
    FirebaseFirestore? firebaseFirestore,
    firebase_auth.FirebaseAuth? firebaseAuth,
  })  : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance,
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  @override
  Future<User> getProfile() async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      final userDoc = await _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .get();
      if (userDoc.exists) {
        return User.fromDoc(userDoc);
      }
      throw ("Get user is empty!");
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

  Future<String?> getPhotoUrlByUID(String uid) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection(ApiPath.USER).doc(uid).get();

      if (userDoc.exists) {
        final user = User.fromDoc(userDoc);
        return user.photoUrl;
      }
      return null;
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception while getting photoUrl',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<String?> getNameUserByUID(String uid) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection(ApiPath.USER).doc(uid).get();
      if (userDoc.exists) {
        final user = User.fromDoc(userDoc);
        return user.displayName;
      }
      return null;
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception while getting name',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> updateUserName(String value) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .update({"displayName": value});
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update user name',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    try {
      await _firebaseAuth.currentUser!
          .updateEmail(newEmail)
          .then((value) => updateEmailCollection(newEmail))
          .catchError(throw ("Update username fail!"));
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update user name',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> updateEmailCollection(String newEmail) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .update({"email": newEmail});
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update email',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> updatePhoneNumberCollection(String phoneNumber) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .update({"phoneNumber": phoneNumber});
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update phone number',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> setCourse(String courseId) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      _firebaseFirestore.collection(ApiPath.USER).doc(userToken).update({
        "course": FieldValue.arrayUnion([courseId])
      });
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception update course',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> setFavorite(String courseId) async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      _firebaseFirestore.collection(ApiPath.USER).doc(userToken).update({
        "favorites_course": FieldValue.arrayUnion([courseId])
      });
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception setFavorite',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<String>> getCourseUser() async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      final DocumentSnapshot snapshot = await _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .get();
      if (snapshot.exists) {
        return User.fromDoc(snapshot).course!;
      }
      throw "Document does not exist";
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseUser',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<List<String>> getFavoriteCourseUser() async {
    try {
      final userToken = await BaseSharedPreferences.getStringValue(
          ManagerKeyStorage.accessToken);
      final DocumentSnapshot snapshot = await _firebaseFirestore
          .collection(ApiPath.USER)
          .doc(userToken)
          .get();
      if (snapshot.exists) {
        return User.fromDoc(snapshot).favoritesCourse!;
      }
      throw "Document does not exist";
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception getCourseUser',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<bool> checkCourseUserById(String courseId) async {
    User user;
    try {
      await _firebaseFirestore.collection(ApiPath.USER).get().then((value) {
        for (var element in value.docs) {
          user = User.fromDoc(element);
          for (String i in user.course!) {
            if (i == courseId) {
              return true;
            }
          }
        }
      });
      return false;
    } on FirebaseException catch (e) {
      throw CustomError(code: e.code, msg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception checkCourseUserById',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  @override
  Future<void> checkFavorite(String courseId) {
    throw UnimplementedError();
  }
}
