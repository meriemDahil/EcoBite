import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
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
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
          
           children: [
            const SizedBox(height: 40,),
             Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Sign in here',style: TextStyle(color: AppColor.primary,fontWeight: FontWeight.bold,fontSize: 24)),
                    const SizedBox(height: 40,),
                    LabeledTextField(hintText: 'email', label: 'email',  textEditingController: _emailController,),
                    SizedBox(height: MediaQuery.of(context).size.height/40,),
                    LabeledTextField(hintText: 'password', label: 'password',textEditingController: _passwordController,),
                    SizedBox(height: MediaQuery.of(context).size.height/40,),
                     RoundedButton(
                    label: 'Sign In',
                    color: AppColor.primary,
                    onTap: () {
                       Navigator.pushReplacementNamed(context, '/home');
                 },
                  ),
                 SizedBox(height: MediaQuery.of(context).size.height/40,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('You don\'t have an account?  ',style: TextStyle(color: Colors.black,fontSize: 16),),
                  GestureDetector(
                     onTap: () {
                    //    Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) =>  Home()),
                     //  );
                      
                    },
                    child: const Text('Sign up here',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17,decoration: TextDecoration.underline,decorationColor: Colors.white),))
                ],
              ),
                  ],
                ),
         )]
           ),
       ])
           );
  }
}