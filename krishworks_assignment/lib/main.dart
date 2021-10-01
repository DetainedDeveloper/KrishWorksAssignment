import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/resources.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const KrishWorksAssignment());
}

class KrishWorksAssignment extends StatelessWidget {
  const KrishWorksAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.light,
      theme: AppThemes.themeData,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
