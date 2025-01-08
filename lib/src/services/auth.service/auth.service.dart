import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  /// Sign in anonymously
  static Future<User?> signInAnonymously() async {
    try {
      User? currentUser = auth.currentUser;
      if (currentUser == null) {
        // No user signed in, sign in anonymously
        UserCredential userCredential = await auth.signInAnonymously();
        currentUser = userCredential.user;
      }

      log('Anonymous sign-in successful, uid: ${currentUser?.uid}',
          name: 'auth');
      return currentUser;
    } catch (e) {
      log('Error during anonymous sign-in: $e');
      return null;
    }
  }
}
