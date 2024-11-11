import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/enum.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FormSignUp extends StatelessWidget {
   final GlobalKey<FormState> formKey;
   FormSignUp({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 130),
        child: Form(
          key:formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up here', style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.black),),
              SizedBox(height: 8,),
              LabeledTextField(
                hintText: 'email',
                label: 'email',
                textEditingController: context.read<AuthCubit>().emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              LabeledTextField(
                hintText: 'password',
                label: 'password',
                textEditingController: context.read<AuthCubit>().passwordController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Password is required' : null,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              LabeledTextField(
                textEditingController: context.read<AuthCubit>().usernameController,
                label: 'Username',
                hintText: 'Enter your username',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              LabeledTextField(
                textEditingController: context.read<AuthCubit>().addressController,
                label: 'Address',
                hintText: 'Enter your address',
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              LabeledTextField(
                textEditingController: context.read<AuthCubit>().phoneController,
                label: 'Phone',
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              RoundedButton(
                label: 'Sign In',
                color: AppColor.primary,
                onTap: () {
                  context.read<AuthCubit>().signUp(UserRole.CUSTOMER);
                },
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'I already have an account, ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signin'); 
                          },
                          child: const Text(
                            'Login here',
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
        ),
      ),
    );
  }
}
