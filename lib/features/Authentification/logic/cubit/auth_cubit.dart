import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eco_bite/core/enum.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  // TextEditingControllers for input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  static const String AUTH_STATUS_KEY = 'auth_status';
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    addressController.clear();
    phoneController.clear();
  }

  AuthCubit(this._authRepository) : super(const AuthState.initial()){
      checkAuthStatus();
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    imageController.dispose();
    return super.close();
  }
  static const String USER_DATA_KEY = 'user_data';  // New key for storing user data

Future<void> signUp() async {
    if (formKeySignUp.currentState?.validate() ?? false) {
      emit(const AuthState.loading());
      try {
        final user = await _authRepository.signUp(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
          role: UserRole.CUSTOMER,
          address: addressController.text,
          phone: phoneController.text,
          image: imageController.text,
        );
        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(AUTH_STATUS_KEY, true);
          await saveUserData(user as UserModel);  // Add this line to save user data
          clearControllers();
          emit(AuthState.success(user: user as UserModel?));
        } else {
          emit(const AuthState.error('Sign up failed.'));
        }
      } catch (e) {
        emit(AuthState.error('Error signing up: $e'));
      }
    }
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = {
        'username': user.username,
        'email': user.email,
        'address': user.address,
        'phone': user.phone,
        'id': user.id,
        'role': user.role.toString(),  // Convert enum to string
      };
      print('Saving user data: $userData'); // Debug print
      await prefs.setString(USER_DATA_KEY, json.encode(userData));
    } catch (e) {
      print('Error saving user data: $e'); // Debug print
    }
  }

  Future<UserModel?> loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userDataString = prefs.getString(USER_DATA_KEY);
      print('Loaded user data string: $userDataString'); // Debug print
      
      if (userDataString != null) {
        final userData = json.decode(userDataString);
        print('Decoded user data: $userData'); // Debug print
        
        return UserModel(
          username: userData['username'],
          email: userData['email'],
          address: userData['address'],
          phone: userData['phone'],
          id: userData['id'],
          password: '',
          role: _parseUserRole(userData['role']),
        );
      }
      print('No user data found'); // Debug print
      return null;
    } catch (e) {
      print('Error loading user data: $e'); // Debug print
      return null;
    }
  }

  UserRole _parseUserRole(String roleStr) {
    switch (roleStr) {
      case 'UserRole.CUSTOMER':
        return UserRole.CUSTOMER;
      case 'UserRole.ADMIN':
        return UserRole.CUSTOMER;
      default:
        return UserRole.CUSTOMER;
    }
  }

  Future<void> checkAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isAuthenticated = prefs.getBool(AUTH_STATUS_KEY) ?? false;
      print('Is authenticated: $isAuthenticated'); // Debug print
      
      if (isAuthenticated) {
        final userData = await loadUserData();
        print('Loaded user data in checkAuthStatus: $userData'); // Debug print
        if (userData != null) {
          emit(AuthState.success(user: userData));
        } else {
          // If we're authenticated but have no user data, something's wrong
          await prefs.setBool(AUTH_STATUS_KEY, false);
          emit(const AuthState.initial());
        }
      } else {
        emit(const AuthState.initial());
      }
    } catch (e) {
      print('Error in checkAuthStatus: $e'); // Debug print
      emit(const AuthState.initial());
    }
  }


  Future<void> signIn() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(const AuthState.loading());
      try {
        final user = await _authRepository.signIn(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        if (user != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool(AUTH_STATUS_KEY, true);
          await saveUserData(user as UserModel);  // Save user data
          clearControllers();
          emit(AuthState.success(user: user as UserModel?));
        } else {
          emit(const AuthState.error('Sign in failed.'));
        }
      } catch (e) {
        emit(AuthState.error('Error signing in: $e'));
      }
    }
  }
  //   Future<void> signUp() async {
  //   if (formKeySignUp.currentState?.validate() ?? false) {
  //     emit(const AuthState.loading());
  //     try {
  //       final user = await _authRepository.signUp(
  //         email: emailController.text,
  //         password: passwordController.text,
  //         username: usernameController.text,
  //         role: UserRole.CUSTOMER,
  //         address: addressController.text,
  //         phone: phoneController.text,
  //         image: imageController.text,
  //       );
  //       if (user != null) {
  //          final prefs = await SharedPreferences.getInstance();
  //          await prefs.setBool(AUTH_STATUS_KEY, true);
  //         clearControllers();
  //         emit(AuthState.success(user: user as UserModel?));
  //       } else {
  //         emit(const AuthState.error('Sign up failed.'));
  //       }
  //     } catch (e) {
  //       emit(AuthState.error('Error signing up: $e'));
  //     }
  //   }
  // }

  Future<void> signOut() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AUTH_STATUS_KEY, false);
      await prefs.remove(USER_DATA_KEY);  // Clear stored user data
      emit(const AuthState.initial());  // Change this from success to initial
    } catch (e) {
      emit(AuthState.error('Error signing out: $e'));
    }
  }

  Future<void> passwordReset()async {
     emit(const AuthState.loading());
     try{
      await _authRepository.passwordReset(emailController.text);
      emit(const AuthState.passwordResteSuccess()); 
     }catch (e) {
      emit(AuthState.error('Error reseting password: $e'));
    }
  }
}

