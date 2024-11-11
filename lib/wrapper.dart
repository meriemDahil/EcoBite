import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/home/ui/home.dart';
import 'package:eco_bite/features/splashScreen/splash_screen.dart';
import 'package:eco_bite/features/splashScreen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => SplashScreen(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (user) => Home(user:user),
          error: (message) => WelcomePage(),
        );
      },
    );
  }
}