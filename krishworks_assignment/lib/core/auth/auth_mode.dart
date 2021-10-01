import 'package:krishworks_assignment/core/resources/strings.dart';

enum AuthMode { signUp, signIn, resetPassword }

abstract class WhichAuthMode {
  static String title({required AuthMode authMode}) {
    switch (authMode) {
      case AuthMode.signUp:
        return AppStrings.signUp;

      case AuthMode.signIn:
        return AppStrings.signIn;

      case AuthMode.resetPassword:
        return AppStrings.resetPassword;
    }
  }

  static String action({required AuthMode authMode}) {
    switch (authMode) {
      case AuthMode.signUp:
        return AppStrings.signIn;

      case AuthMode.signIn:
        return AppStrings.signUp;

      case AuthMode.resetPassword:
        return AppStrings.signIn;
    }
  }

  static String description({required AuthMode authMode}) {
    switch (authMode) {
      case AuthMode.signUp:
        return 'Already have an account?';

      case AuthMode.signIn:
        return 'Don\'t have an account?';

      case AuthMode.resetPassword:
        return 'Go back to';
    }
  }
}
