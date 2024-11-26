import 'package:eco_bite/core/enum_role.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/create_offre/ui/add_offer.dart';
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
        return state.maybeWhen(
          initial: () => SplashScreen(),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (user)
          {
            // print(user?.role.name);
            // if(user?.role.name == 'RESTAURANT_OWNER')
            // return AddOffer(user: user,);
            // else
             return Home(user: user,);      
          },
          error: (message) => WelcomePage(),
          orElse: ()=> Center(child: CircularProgressIndicator())
        
        );
      },
    );
  }
}