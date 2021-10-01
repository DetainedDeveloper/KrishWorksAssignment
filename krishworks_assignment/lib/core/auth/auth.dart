import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  static FirebaseAuth get instance => FirebaseAuth.instance;

  static Future<void> signOut() => instance.signOut();

  static Future<bool?> get isSignedIn async => instance.currentUser != null;

  static String get userName => instance.currentUser!.displayName ?? '';

  static Future<String> signUp({
    required String displayName,
    required String email,
    required String password,
  }) async {
    try {
      await instance.createUserWithEmailAndPassword(email: email, password: password);
      return await setDisplayName(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for $email';
      } else {
        return 'Error : ${e.message}';
      }
    } catch (e) {
      return 'Error : $e';
    }
  }

  static Future<String> setDisplayName({required String displayName}) async {
    try {
      await instance.currentUser!.updateDisplayName(displayName);
      await instance.currentUser!.reload();
      return 'Account created successfully!';
    } on FirebaseAuthException catch (e) {
      return 'Error : ${e.message}';
    } catch (e) {
      return 'Error : $e';
    }
  }

  static Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await instance.signInWithEmailAndPassword(email: email, password: password);
      return 'Login successful';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for $email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else {
        return 'Error : ${e.message}';
      }
    } catch (e) {
      return 'Error : $e';
    }
  }

  static Future<String> resetPassword({
    required String email,
  }) async {
    try {
      await instance.sendPasswordResetEmail(email: email);
      return 'A link to reset password has been sent at $email';
    } on FirebaseAuthException catch (e) {
      return 'Error : ${e.message}';
    } catch (e) {
      return 'Error : $e';
    }
  }
}
