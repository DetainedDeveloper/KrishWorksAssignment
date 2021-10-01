import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/auth/auth_mode.dart';
import 'package:krishworks_assignment/core/resources/dimensions.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';
import 'package:krishworks_assignment/features/authentication/controller/auth_controller.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/footer.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/reset_password.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/sign_in.dart';
import 'package:krishworks_assignment/features/authentication/view/widgets/sign_up.dart';
import 'package:krishworks_assignment/features/core/widgets/big_text.dart';
import 'package:krishworks_assignment/features/core/widgets/wave_design.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late StreamSubscription<User?> _userSubscription;

  @override
  void initState() {
    super.initState();
    AuthController.instance.setAuthMode(authMode: AuthMode.signIn);
    _userSubscription = AuthController.instance.authInstance.userChanges().listen((user) {
      if (user != null && user.displayName != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthMode>(
      valueListenable: AuthController.instance.authMode,
      builder: (context, authMode, widget) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppDimensions.d128),
            child: Container(
              padding: const EdgeInsets.only(top: AppDimensions.d32),
              decoration: const BoxDecoration(color: AppColors.primary),
              child: BigText(text: WhichAuthMode.title(authMode: authMode)),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              const ClipPath(
                clipper: WaveDesign(),
                child: DecoratedBox(decoration: BoxDecoration(color: AppColors.primary)),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Builder(
                    builder: (context) {
                      switch (authMode) {
                        case AuthMode.signUp:
                          return const SignUpCard();

                        case AuthMode.signIn:
                          return const SignInCard();

                        case AuthMode.resetPassword:
                          return const ForgotPasswordCard();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Footer(authMode: authMode),
        );
      },
    );
  }
}
