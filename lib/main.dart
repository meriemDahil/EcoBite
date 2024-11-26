import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/repo/auth_repo.dart';
import 'package:eco_bite/features/Authentification/ui/sign_up.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart';
import 'package:eco_bite/features/splashScreen/welcome_page.dart';
import 'package:eco_bite/firebase_options.dart';
import 'package:eco_bite/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(FirebaseAuthRepository()),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //  "/": (context) => WelcomePage(),
        "/signin": (context) => SignIn(),
        //"/home": (context) => Home(user: null,),
        // "/tabbar": (context) => Tabbar(),
        "/signup": (context) => SignUpPage(),
        "/welcomepage": (context) => WelcomePage()
      },
      title: 'Eco Bite',
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}
