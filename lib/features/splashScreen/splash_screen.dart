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
    Timer(const Duration(seconds: 4), (){
                if (mounted) {
      Navigator.pushReplacementNamed(context, '/welcomepage');
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
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