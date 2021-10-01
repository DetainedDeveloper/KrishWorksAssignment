import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:krishworks_assignment/core/auth/auth_mode.dart';
import 'package:krishworks_assignment/features/authentication/model/auth_model.dart';

class AuthController {
  AuthController._();

  static final AuthController _instance = AuthController._();

  static AuthController get instance => _instance;

  ValueNotifier<AuthMode> get authMode => AuthModel.authMode;

  void setAuthMode({required AuthMode authMode}) => AuthModel.setAuthMode(authMode: authMode);

  ValueNotifier<bool> get isPasswordHidden => AuthModel.isPasswordHidden;

  void togglePasswordVisibility() => AuthModel.togglePasswordVisibility();

  ValueNotifier<bool> get showProgress => AuthModel.showProgress;

  void toggleProgress() => AuthModel.toggleProgress();

  FirebaseAuth get authInstance => AuthModel.instance;

  Future<void> signOut() async => await AuthModel.signOut();

  Future<bool?> get isSignedIn async => await AuthModel.isSignedIn;

  String get userName => AuthModel.userName;

  Future<String> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async => await AuthModel.signUp(displayName: displayName, email: email, password: password);

  Future<String> signIn({
    required String email,
    required String password,
  }) async => await AuthModel.signIn(email: email, password: password);

  Future<String> resetPassword({
    required String email
  }) async => await AuthModel.resetPassword(email: email);
}
