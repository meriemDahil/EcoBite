
import 'package:eco_bite/core/enum.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRepository {
  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String username,
    required UserRole role,
    String? address,
    String? phone,
    String? image,
  });
  Future<UserModel?> signIn({required String email, required String password});
  Future<void> signOut();
  Future<void> passwordReset(String mail);
  
  

  
}
class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel?> signUp({
    required String email,
    required String password,
    required String username,
    required UserRole role,
    String? address,
    String? phone,
    String? image,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = userCredential.user!.uid;

      // Save additional details in Firestore
      await _firestore.collection('users').doc(userId).set({
        'username': username,
        'email': email,
        'role': role.name,
        'address': address,
        'phone': phone,
        'image': image,
      });

      return UserModel(
        id: userId,
        username: username,
        email: email,
        password: password,
        role: role,
        address: address,
        phone: phone,
        image: image,
      );
    } catch (e) {
      debugPrint('Error signing up: $e');
      return null;
    }
  }

  @override
  Future<UserModel?> signIn({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userId = userCredential.user!.uid;

      final userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        final userData = userDoc.data()!;
        return UserModel(
          id: userId,
          username: userData['username'],
          email: email,
          password: password,
          role: UserRole.values.byName(userData['role']),
          address: userData['address'],
          phone: userData['phone'],
          image: userData['image'],
        );
      } else {
        debugPrint('User details not found in Firestore.');
        return null;
      }
    } catch (e) {
      debugPrint('Error signing in: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> passwordReset(String mail) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: mail.trim());
     
    }on FirebaseAuthException catch(e){
      print(e);
    }
  }

}
