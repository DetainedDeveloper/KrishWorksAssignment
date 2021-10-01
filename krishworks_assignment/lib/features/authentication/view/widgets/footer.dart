import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/auth/auth_mode.dart';
import 'package:krishworks_assignment/core/resources/colors.dart';
import 'package:krishworks_assignment/core/resources/dimensions.dart';
import 'package:krishworks_assignment/features/authentication/controller/auth_controller.dart';
import 'package:krishworks_assignment/features/core/widgets/button.dart';

class Footer extends StatelessWidget {
  final AuthMode authMode;

  const Footer({Key? key, required this.authMode}) : super(key: key);

  AuthMode getAuthMode({required AuthMode authMode}) {
    switch (authMode) {
      case AuthMode.signUp:
        return AuthMode.signIn;

      case AuthMode.signIn:
        return AuthMode.signUp;

      case AuthMode.resetPassword:
        return AuthMode.signIn;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(AppDimensions.d64),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            WhichAuthMode.description(authMode: authMode),
            style: Theme.of(context).snackBarTheme.contentTextStyle!.copyWith(color: AppColors.primary),
          ),
          Button(
            title: WhichAuthMode.action(authMode: authMode),
            onPressed: () => AuthController.instance.setAuthMode(authMode: getAuthMode(authMode: authMode)),
          ),
        ],
      ),
    );
  }
}
