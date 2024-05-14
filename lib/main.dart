import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crosspay/theme/themes.dart';
import 'package:crosspay/screens/authentication/welcome_screen/view.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:crosspay/utils/c_p_constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:crosspay/controllers/user_controller.dart';
import 'package:crosspay/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: '.env');
  CPConstants().initHive();

  String oneSignalAppId = CPConstants().ONESIGNAL_APP_ID!;
  OneSignal.initialize(oneSignalAppId);
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(
        title: 'CrossPay',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeMode.light,
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      var userController = Get.put(UserController());
      userController.checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
