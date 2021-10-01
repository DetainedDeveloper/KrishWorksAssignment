import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:krishworks_assignment/core/auth/auth.dart';
import 'package:krishworks_assignment/core/auth/auth_mode.dart';

abstract class AuthModel {
  static final ValueNotifier<AuthMode> _authMode = ValueNotifier(AuthMode.signIn);

  static ValueNotifier<AuthMode> get authMode => _authMode;

  static void setAuthMode({required AuthMode authMode}) => _authMode.value = authMode;

  static final ValueNotifier<bool> _isPasswordHidden = ValueNotifier(true);

  static ValueNotifier<bool> get isPasswordHidden => _isPasswordHidden;

  static void togglePasswordVisibility() => _isPasswordHidden.value = !_isPasswordHidden.value;

  static final ValueNotifier<bool> _showProgress = ValueNotifier(false);

  static ValueNotifier<bool> get showProgress => _showProgress;

  static void toggleProgress() => _showProgress.value = !_showProgress.value;

  static FirebaseAuth get instance => Auth.instance;

  static Future<void> signOut() async => await Auth.signOut();

  static Future<bool?> get isSignedIn async => await Auth.isSignedIn;

  static String get userName => Auth.userName;

  static Future<String> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async => await Auth.signUp(displayName: displayName, email: email, password: password);

  static Future<String> signIn({
    required String email,
    required String password,
  }) async => await Auth.signIn(email: email, password: password);

  static Future<String> resetPassword({
    required String email
  }) async => await Auth.resetPassword(email: email);
}
