import 'dart:async';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/splashScreen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer that lasts for 3 seconds
    Timer(const Duration(seconds: 3), (){
      // Navigate to the next screen (e.g., HomeScreen)
                if (mounted) {
      Navigator.pushReplacementNamed(context, '/welcomepage');
    }
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => WelcomePage()),
      // );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage("assets/logo.png",),height: 150,),
            SvgPicture.asset(
             'assets/svg/logo.svg', 
                width: 100,
              ),
          ],
        ),
      ),
    );
  }
}