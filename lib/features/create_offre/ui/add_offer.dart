import 'dart:io';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddOffer extends StatefulWidget {
   final UserModel? user;
   AddOffer({Key? key, required this.user}) : super(key: key);

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  
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
        //   BlocConsumer<AuthCubit, AuthState>(
        //     listener: (context, state) {
        //       if (state is Error) {
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //           content: Text(state.error),
        //           backgroundColor: Colors.red,
        //         ));
        //       }
        //       if (state is Success) {
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //           content: Text('Sign up successful! ${state.user?.username}'),
        //           backgroundColor: Colors.green,
        //         ));
        //         Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => Home(user: state.user)),
        //           (route) => false,
        //         );
        //       }
        //       if (state is Loading){
        //           showDialog(
        //             context: context,
        //             barrierDismissible: false,
        //             builder: (context) => Center(
        //               child: CircularProgressIndicator(
        //                 color: Colors.deepOrange,
        //               ),
        //             ),
        //           );
        //  }
        //     },   
        //     builder: (context, state) {
        //         return 
        SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 130),
                    child: Form(
                     // key:formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Add new offer here', style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.black),),                
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          LabeledTextField(
                           // textEditingController: context.read<AuthCubit>().addressController,
                            label: 'Restaurant name',
                            hintText: widget.user?.username,
                            readOnly: true,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          LabeledTextField(
                           // textEditingController: context.read<AuthCubit>().addressController,
                            label: 'description',
                            hintText: 'add description',
                            maxLines: 2,
                            
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          LabeledTextField(
                           // textEditingController: context.read<AuthCubit>().addressController,
                            label: 'Address',
                            hintText: widget.user?.address,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          LabeledTextField(
                           // textEditingController: context.read<AuthCubit>().phoneController,
                            label: 'Phone number',
                            hintText: widget.user?.phone,
                            keyboardType: TextInputType.phone,
                            readOnly: true,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          LabeledTextField(
                            hintText: 'meal name',
                            label: 'meal name',
                            //textEditingController: context.read<AuthCubit>().emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                         
                          BlocBuilder<ImageCubit, ImageState>(
                            builder: (context, state) {
                              if (state is Initial) {
                                return RoundedButton(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                                  label: "Pick Image from Gallery",
                                  onTap: () async {
                                    await context.read<ImageCubit>().pickImage();
                                  },
                                );
                              } else if (state is Success) {
                                return Column(
                                  children: [
                                    Image.file(
                                      File(state.image_path),
                                      height: 200,
                                    ),
                                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                                    RoundedButton(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                                      label: "Add another image",
                                      onTap: () {
                                        context.read<ImageCubit>().reset();
                                      },
                                    ),
                                  ],
                                );
                              } else if (state is Error) {
                                return Column(
                                  children: [
                                    Text(state.message),
                                    SizedBox(height: MediaQuery.of(context).size.height / 40),
                                    RoundedButton(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                                      label: "Try again",
                                      onTap: () {
                                        context.read<ImageCubit>().reset();
                                      },
                                    ),
                                  ],
                                );
                              }

                              // Fallback to avoid returning 'nothing' when no valid state is emitted
                              return Container();
                            },
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height / 40),
                          RoundedButton(
                            label: 'Add offer',
                            color: AppColor.primary,
                            onTap: ()async {
                            //await context.read<AuthCubit>().signUp();
                            },
                          ),

                           
                        ],
                      ),
                    ),
                  ),
        )
  ]),
    );
  }
}
              
      