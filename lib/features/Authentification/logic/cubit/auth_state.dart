part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success({UserModel? user}) = Success;
  const factory AuthState.passwordResteSuccess({UserModel? user}) = PasswordResteSuccess;
  const factory AuthState.error(String error) = Error;
}
