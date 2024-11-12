import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/enum_message_type.dart';
import 'package:eco_bite/core/flash_utils.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/widgets/form_sign_in.dart';
import 'package:eco_bite/features/home/ui/home.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 6,
            left: 0,
            child: SvgPicture.asset(
              'assets/svg/circle.svg',
              width: 40,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/svg/right_corner.svg',
              width: 100,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg/corner.svg',
              width: 100,
            ),
          ),
          BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
            Navigator.pop(context);
          }
          if (state is Success) {
             FlashUtils.showCustomFlash(
                          context: context,
                          message: 'Login successful! ${state.user?.username}',
                          type: MessageType.success,
                          position: FlashPosition.bottom
                          

                        );
            // ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            //   content: Text('Login successful! ${state.user?.username}'),
            //   backgroundColor: Colors.green,
            // ));
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home(user: state.user,)),
              (route) => false,
            );
          }
          if (state is Loading){
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    ),
                  );
         }
        },  
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
              children: [
                Text(
                  'Welcome To ',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black),
                ),
                Text(
              'EcoBite',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.primary),
            ),
              ],
            ),
            Text(
                  'Here’s your first step in the journey to reduce food waste. ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
                ),
                     
             
                Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), 
                        child: FormSignIn(formKey: context.read<AuthCubit>().formKey),
                      ),
                    ),
              ],
            ),
          );
        },
  ),
        ],
      ),
    );
  }
}
