import 'package:flutter/material.dart';
import 'package:groupe/screens/splash_screen/welcome_screen.dart';
import 'package:hive/hive.dart';
import 'package:groupe/security/jwt_security.dart';
import 'package:groupe/service/user.dart';
import 'package:flutter/material.dart';
import 'classes/application_user.dart';
import 'classes/hive.dart';

Future allBoxes = Future.wait([
  Hive.openBox<JWTSecure>("javaTokenSecurity"),
  Hive.openBox<ApplicationUser>("userInformations"),
]);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize Hive
  await HiveHelper.init();

  await allBoxes;

  await UserService.applicationBridge();

  runApp(MyHomePage());
}
const d_red = const Color(0xFFE9717D);

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: SplashScreen(),
        ),
      ),
    );
  }
}




