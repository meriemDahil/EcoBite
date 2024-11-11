import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/widgets/form_sign_up.dart';
import 'package:eco_bite/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
          }
          if (state is Success) {
            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
              content: Text('Sign up successful! ${state.user?.username}'),
              backgroundColor: Colors.green,
            ));
           Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home(user: state.user)),
              (route) => false,
            );
          }
          if (state is Loading){
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: CircularProgressIndicator(),
     
          );
         }
        },  
        builder: (context, state) {
          return FormSignUp(formKey: context.read<AuthCubit>().formKeySignUp);
        },
  ),
]
)
);
}
}
