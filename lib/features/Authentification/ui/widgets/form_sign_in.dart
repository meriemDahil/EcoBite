import 'dart:ffi';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/core/size.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignIn extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  FormSignIn({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(height: 40),
          const Text(
            'Login here',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          const SizedBox(height: 16),
          LabeledTextField(
            hintText: 'email',
            label: 'email',
            textEditingController: context.read<AuthCubit>().emailController,
            validator: (value) => value == null || value.isEmpty ? 'Please enter an email' : null,
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 40),
          LabeledTextField(
            hintText: 'password',
            label: 'password',
            textEditingController: context.read<AuthCubit>().passwordController,
            validator: (value) => value == null || value.isEmpty ? 'Please enter a password' : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is PasswordResteSuccess) {
                          // Close the dialog immediately
                          Navigator.pop(context);
                          // Then show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Password reset link sent successfully! Please check your email.')),
                          );
                        } else if (state is Error) {
                          // Close the dialog in case of error
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is Loading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          backgroundColor: Colors.white,
                          content: Container(
                            padding: EdgeInsets.all(10.0),
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 1.3,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Enter your email, and we will send you a password reset link.'),
                                SizedBox(height: MediaQuery.of(context).size.height / 70),
                                LabeledTextField(
                                  label: "Email",
                                  hintText: "Email",
                                  textEditingController: context.read<AuthCubit>().emailController,
                                ),
                                RoundedButton(
                                  label: "Send Reset Link",
                                  onTap: () async {
                                    // Close the dialog immediately when the button is pressed
                                    Navigator.pop(context);
                                    // Perform the password reset action
                                    await context.read<AuthCubit>().passwordReset();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: const Text(
                'Forget password?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          RoundedButton(
            label: 'Sign In',
            color: AppColor.primary,
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthCubit>().signIn();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You don\'t have an account?  ',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: const Text(
                    'Sign up here',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignIn extends StatelessWidget {
  final GlobalKey<FormState> formKey;
   FormSignIn({super.key, required this.formKey,});

  @override
  Widget build(BuildContext context) {
    return Form(
              key:
              formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  const SizedBox(height: 40),
                  const Text('Login here', style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.black),),
                  SizedBox(height: 16,),
                  
                  LabeledTextField(
                    hintText: 'email',
                    label: 'email',
                    textEditingController: context.read<AuthCubit>().emailController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter an email'
                        : null,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  LabeledTextField(
                    hintText: 'password',
                    label: 'password',
                    textEditingController: context.read<AuthCubit>().passwordController,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter a password'
                        : null,
                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                     child: GestureDetector(
                          onTap: () {
                               Navigator.pushReplacementNamed(context, '/signup'); 
                          },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                   ),
                
                  RoundedButton(
                    label: 'Sign In',
                    color: AppColor.primary,
                    onTap: () {
                      context.read<AuthCubit>().signIn(); 
                    },
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'You don\'t have an account?  ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                             Navigator.pushReplacementNamed(context, '/signup'); 
                          },
                          child: const Text(
                            'Sign up here',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
  }
}

 */