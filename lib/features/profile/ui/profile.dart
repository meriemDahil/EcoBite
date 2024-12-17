import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/panier/ui/panier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final UserModel? user;
  Profile({super.key, required this.user});
  @override
  State createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _address = "Fetching location...";

late PointsManager points;
  int? point; // Now point is nullable

  @override
  void initState() {
    super.initState();
    points = PointsManager();
    _initializePoints();
  }

  // Async method to initialize points
  Future<void> _initializePoints() async {
    point = await points.getPoints(); // Await the points fetch
    setState(() {}); // Trigger rebuild once points are fetched
  }


  Future<void> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _address = "Location services are disabled.";
        });
        return;
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _address = "Location permission denied.";
          });
          return;
        }
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get the address using Nominatim (OpenStreetMap) API
      final response = await http.get(
        Uri.parse(
            'https://nominatim.openstreetmap.org/reverse?lat=${position.latitude}&lon=${position.longitude}&format=json'),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data['address'] != null) {
          setState(() {
            _address = data['address']['road'] ??
                data['address']['village'] ??
                data['address']['city'] ??
                "No address found.";
          });
        } else {
          setState(() {
            _address = "No address found.";
          });
        }
      } else {
        setState(() {
          _address = "Error fetching address.";
        });
      }
    } catch (e) {
      setState(() {
        _address = "Error: $e";
      });
    }
  }

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
                  hintText: widget.user!.email,
                  label: 'email',
                  readOnly: true,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: "username",
                  hintText: widget.user!.username,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'Address',
                  hintText: _address,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'phone number',
                  hintText: widget.user!.phone,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 40),
                LabeledTextField(
                  label: 'My points',
                  hintText: point.toString(),
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
