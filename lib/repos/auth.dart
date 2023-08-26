import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:quiz_flutter/models/auth.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var currentUser;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((event) {
      final user = event == null ? User.empty : event.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  Future<void> logout() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } catch (_) {}
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(
        uid: uid, email: email, displayName: displayName, photoUrl: photoURL);
  }
}
