import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  final UserModel? user;
  Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User information',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                ),
                LabeledTextField(
                  hintText: user!.email,
                  label: 'email',
                  readOnly: true,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: "username",
                  hintText: user!.username,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'Address',
                  hintText: user!.address,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'phone number',
                  hintText: user!.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'My points',
                  hintText: '20',
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                RoundedButton(
                  label: 'Logout',
                  color: AppColor.primary,
                  onTap: () async {
                    context.read<AuthCubit>().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
