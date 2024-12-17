import 'package:eco_bite/core/notificationsService.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/repo/auth_repo.dart';
import 'package:eco_bite/features/Authentification/ui/sign_up.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/comment/logic/cubit/comment_cubit.dart';
import 'package:eco_bite/features/comment/repo/comment_repo.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/add_offer_cubit.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart';
import 'package:eco_bite/features/create_offre/repo/add_offer_repo.dart';
import 'package:eco_bite/features/home/logic/cubit/restaurant_cubit.dart';
import 'package:eco_bite/features/home/repo/restaurant_repo.dart';
import 'package:eco_bite/features/home/ui/restaurant_details.dart';
import 'package:eco_bite/features/offers/logic/cubit/offers_cubit.dart';
import 'package:eco_bite/features/offers/repo/offers_repo.dart';
import 'package:eco_bite/features/splashScreen/welcome_page.dart';
import 'package:eco_bite/firebase_options.dart';
import 'package:eco_bite/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.instance.initialize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(FirebaseAuthRepository()),
        ),
        BlocProvider(
          create: (context) => ImageCubit(),
        ),
        BlocProvider(
            create: (context) => RestaurantCubit(RestaurantRepository())),
        BlocProvider(create: (context) => OffersCubit(OffersRepository())),
        BlocProvider(
          create: (context) => AddOfferCubit(OfferRepository()),
        ),
        BlocProvider(
          create: (context) => CommentCubit(CommentsRepo()),
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
    navigatorKey: navigatorKey;
    return MaterialApp(
      routes: {
        //  "/": (context) => WelcomePage(),
        "/signin": (context) => SignIn(),
        "/signup": (context) => SignUpPage(),
        "/welcomepage": (context) => WelcomePage(),
        "/restaurantDetails":(context) => RestaurantDetails()
      },
      title: 'Eco Bite',
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
    );
  }
}
