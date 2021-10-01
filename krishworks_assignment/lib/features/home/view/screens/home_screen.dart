import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/colors.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';
import 'package:krishworks_assignment/features/authentication/controller/auth_controller.dart';
import 'package:krishworks_assignment/features/core/widgets/big_text.dart';
import 'package:krishworks_assignment/features/core/widgets/wave_design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription<User?> _userSubscription;

  @override
  void initState() {
    super.initState();
    _userSubscription = AuthController.instance.authInstance.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, AppRoutes.auth);
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(AppStrings.appName),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const ClipPath(
            clipper: WaveDesign(),
            child: DecoratedBox(decoration: BoxDecoration(color: AppColors.primary)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BigText(text: 'Welcome,\n${AuthController.instance.userName}'),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: const Text(AppStrings.signOut),
        onPressed: () async => await AuthController.instance.signOut(),
      ),
    );
  }
}
