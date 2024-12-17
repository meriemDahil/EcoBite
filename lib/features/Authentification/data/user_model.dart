import 'package:eco_bite/core/enum_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,               // Firebase User ID (UID)
    required String username,         // Username
    required String email,            // User email
    required String password,         // Stored password
    required UserRole role,           // User role (enum)
    String? address,                  // Optional address
    String? phone,                    // Optional phone number
    String? image,       
    double? points,             // Optional image URL
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
