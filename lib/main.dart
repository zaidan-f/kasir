import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_roma.dart';
import 'welcome_screen.dart';
import 'signup_screen.dart';
import 'login_screen.dart';
import 'register_roma.dart';
import 'home_admin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => WelcomeScreen(),
        // 'registration_screen': (context) => RegistrationScreen(),
        'registration_screen': (context) => RegistrationPage(),
        'login_screen': (context) => LoginScreen(),
        'home_roma': (context) => BelajarNavBar(),
         'home_admin': (context) => HomeAdmin(),
      },
    );
  }
}
