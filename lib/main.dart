import 'package:eco_bite/features/home/ui/home.dart';
import 'package:eco_bite/features/home/ui/tab_bar.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/splashScreen/splash_screen.dart';
import 'package:eco_bite/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       routes: {
      //  "/": (context) => WelcomePage(),
        "/signIp": (context) => SignIn(),
        "/home": (context) => Home(),
        "/tabbar":(context) => Tabbar()
      },
      title: 'Eco Bite',
          debugShowCheckedModeBanner: false,
          home:  SplashScreen(),
    );
    
  }
}
