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
  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated = prefs.getBool(AUTH_STATUS_KEY) ?? false;
    
    if (isAuthenticated) {
      
      emit(AuthState.success()); 
    }
  }

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

  Future<void> signOut() async {
    emit(const AuthState.loading());
    try {
      await _authRepository.signOut();
       final prefs = await SharedPreferences.getInstance();
       await prefs.setBool(AUTH_STATUS_KEY, false);
       
      emit(const AuthState.success()); 
       
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

