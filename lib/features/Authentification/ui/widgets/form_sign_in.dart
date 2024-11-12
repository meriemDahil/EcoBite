import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/enum_message_type.dart';
import 'package:eco_bite/core/flash_utils.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormSignIn extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  FormSignIn({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        
        child:Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40),
         
          const Text(
            'Login here',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColor.primary),
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
            child:GestureDetector(
            onTap: () {
              context.read<AuthCubit>().emailController.clear();
              showDialog(
                context: context,
                barrierDismissible: false, 
                builder: (BuildContext context) {
                  return BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is PasswordResteSuccess) {
                        Navigator.pop(context);
                       
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Password reset link sent successfully! Please check your email.'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (state is Error) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is Loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        backgroundColor: Colors.white,
                        content: Container(
                          padding: const EdgeInsets.all(10.0),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 1.3,
                          ),
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Enter your email, and we will send you a password reset link.',
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height / 70),
                                LabeledTextField(
                                  label: "Email",
                                  hintText: "email",
                                  textEditingController: context.read<AuthCubit>().emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    if (!value.contains('@') || !value.contains('.')) {
                                      return 'Please enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancel'),
                                    ),
                                    const SizedBox(width: 8),
                                    RoundedButton(
                                      label: "Send",
                                      onTap: () async{ 
                                        await context.read<AuthCubit>().passwordReset();
                                      Navigator.pop(context);}
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
            onTap: () async{
              if (formKey.currentState!.validate()) {
              await  context.read<AuthCubit>().signIn();
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
    ));
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