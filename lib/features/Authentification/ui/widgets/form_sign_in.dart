import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignIn extends StatelessWidget {
  const FormSignIn({super.key,});

  @override
  Widget build(BuildContext context) {
    return Form(
              key: context.read<AuthCubit>().formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Sign in here',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  RoundedButton(
                    label: 'Sign In',
                    color: AppColor.primary,
                    onTap: () {
                      context.read<AuthCubit>().signIn(); // Trigger signIn in AuthCubit
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'You don\'t have an account?  ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup'); 
                        },
                        child: const Text(
                          'Sign up here',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}