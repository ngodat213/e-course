import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/const/const.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/models/user.dart';
import 'package:quiz_flutter/models/custom_error.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFireStore;

  AuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _firebaseFireStore = firebaseFirestore ?? FirebaseFirestore.instance;

  var currentUser;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((event) {
      final user = event == null ? User.empty : event.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> signUp({
    required String displayName,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    try {
      final firebase_auth.UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final signedInUser = userCredential.user!;
      await _firebaseFireStore
          .collection(ApiPath.USER)
          .doc(signedInUser.uid)
          .set({
        'displayName': displayName,
        'email': email,
        'phoneNumber': phoneNumber,
        'photoUrl': DEFAULT_AVATAR,
        'favorites_course': [],
        'favorites_teacher': [],
        'course': [],
      });
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email address is not valid");
      }
      throw CustomError(
        code: e.code,
        msg: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = credential.user;
      if (user != null) {
        String? assetToken = user.uid;
        BaseSharedPreferences.saveStringValue(
            ManagerKeyStorage.accessToken, assetToken);
        BaseSharedPreferences.savedBoolValue(ManagerKeyStorage.keepLogin, true);
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo(msg: "No user found for that email address");
      } else if (e.code == 'wrong-password') {
        toastInfo(msg: "Wrong passwrod");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email format is wrong");
      }
      throw CustomError(
        code: e.code,
        msg: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> logout() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        msg: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw CustomError(
        code: e.code,
        msg: e.message!,
        plugin: e.plugin,
      );
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        msg: e.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
        uid: uid, email: email, displayName: displayName, photoUrl: photoURL);
  }
}
