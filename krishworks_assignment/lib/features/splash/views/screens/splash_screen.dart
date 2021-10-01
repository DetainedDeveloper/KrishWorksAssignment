import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/auth/auth.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';
import 'package:krishworks_assignment/core/resources/routes.dart';
import 'package:krishworks_assignment/features/core/widgets/loading_indicator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _navigate({required BuildContext context}) async {
    bool? signedIn = await Auth.isSignedIn;
    if (signedIn != null && signedIn) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _navigate(context: context),
        builder: (context, snapshot) {
          return const LoadingIndicator();
        },
      ),
    );
  }
}
