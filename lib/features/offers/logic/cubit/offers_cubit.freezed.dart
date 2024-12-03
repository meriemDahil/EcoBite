// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OffersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OfferModel> offers) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OfferModel> offers)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OfferModel> offers)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(OffersLoading value) loading,
    required TResult Function(OffersSuccess value) success,
    required TResult Function(OffersError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(OffersLoading value)? loading,
    TResult? Function(OffersSuccess value)? success,
    TResult? Function(OffersError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(OffersLoading value)? loading,
    TResult Function(OffersSuccess value)? success,
    TResult Function(OffersError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OffersStateCopyWith<$Res> {
  factory $OffersStateCopyWith(
          OffersState value, $Res Function(OffersState) then) =
      _$OffersStateCopyWithImpl<$Res, OffersState>;
}

/// @nodoc
class _$OffersStateCopyWithImpl<$Res, $Val extends OffersState>
    implements $OffersStateCopyWith<$Res> {
  _$OffersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OffersStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'OffersState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OfferModel> offers) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OfferModel> offers)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OfferModel> offers)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(OffersLoading value) loading,
    required TResult Function(OffersSuccess value) success,
    required TResult Function(OffersError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(OffersLoading value)? loading,
    TResult? Function(OffersSuccess value)? success,
    TResult? Function(OffersError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(OffersLoading value)? loading,
    TResult Function(OffersSuccess value)? success,
    TResult Function(OffersError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OffersState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$OffersLoadingImplCopyWith<$Res> {
  factory _$$OffersLoadingImplCopyWith(
          _$OffersLoadingImpl value, $Res Function(_$OffersLoadingImpl) then) =
      __$$OffersLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OffersLoadingImplCopyWithImpl<$Res>
    extends _$OffersStateCopyWithImpl<$Res, _$OffersLoadingImpl>
    implements _$$OffersLoadingImplCopyWith<$Res> {
  __$$OffersLoadingImplCopyWithImpl(
      _$OffersLoadingImpl _value, $Res Function(_$OffersLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OffersLoadingImpl implements OffersLoading {
  const _$OffersLoadingImpl();

  @override
  String toString() {
    return 'OffersState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OffersLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OfferModel> offers) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OfferModel> offers)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OfferModel> offers)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(OffersLoading value) loading,
    required TResult Function(OffersSuccess value) success,
    required TResult Function(OffersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(OffersLoading value)? loading,
    TResult? Function(OffersSuccess value)? success,
    TResult? Function(OffersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(OffersLoading value)? loading,
    TResult Function(OffersSuccess value)? success,
    TResult Function(OffersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OffersLoading implements OffersState {
  const factory OffersLoading() = _$OffersLoadingImpl;
}

/// @nodoc
abstract class _$$OffersSuccessImplCopyWith<$Res> {
  factory _$$OffersSuccessImplCopyWith(
          _$OffersSuccessImpl value, $Res Function(_$OffersSuccessImpl) then) =
      __$$OffersSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OfferModel> offers});
}

/// @nodoc
class __$$OffersSuccessImplCopyWithImpl<$Res>
    extends _$OffersStateCopyWithImpl<$Res, _$OffersSuccessImpl>
    implements _$$OffersSuccessImplCopyWith<$Res> {
  __$$OffersSuccessImplCopyWithImpl(
      _$OffersSuccessImpl _value, $Res Function(_$OffersSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offers = null,
  }) {
    return _then(_$OffersSuccessImpl(
      null == offers
          ? _value._offers
          : offers // ignore: cast_nullable_to_non_nullable
              as List<OfferModel>,
    ));
  }
}

/// @nodoc

class _$OffersSuccessImpl implements OffersSuccess {
  const _$OffersSuccessImpl(final List<OfferModel> offers) : _offers = offers;

  final List<OfferModel> _offers;
  @override
  List<OfferModel> get offers {
    if (_offers is EqualUnmodifiableListView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offers);
  }

  @override
  String toString() {
    return 'OffersState.success(offers: $offers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersSuccessImpl &&
            const DeepCollectionEquality().equals(other._offers, _offers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_offers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersSuccessImplCopyWith<_$OffersSuccessImpl> get copyWith =>
      __$$OffersSuccessImplCopyWithImpl<_$OffersSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OfferModel> offers) success,
    required TResult Function(String message) error,
  }) {
    return success(offers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OfferModel> offers)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(offers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OfferModel> offers)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(offers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(OffersLoading value) loading,
    required TResult Function(OffersSuccess value) success,
    required TResult Function(OffersError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(OffersLoading value)? loading,
    TResult? Function(OffersSuccess value)? success,
    TResult? Function(OffersError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(OffersLoading value)? loading,
    TResult Function(OffersSuccess value)? success,
    TResult Function(OffersError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OffersSuccess implements OffersState {
  const factory OffersSuccess(final List<OfferModel> offers) =
      _$OffersSuccessImpl;

  List<OfferModel> get offers;
  @JsonKey(ignore: true)
  _$$OffersSuccessImplCopyWith<_$OffersSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OffersErrorImplCopyWith<$Res> {
  factory _$$OffersErrorImplCopyWith(
          _$OffersErrorImpl value, $Res Function(_$OffersErrorImpl) then) =
      __$$OffersErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OffersErrorImplCopyWithImpl<$Res>
    extends _$OffersStateCopyWithImpl<$Res, _$OffersErrorImpl>
    implements _$$OffersErrorImplCopyWith<$Res> {
  __$$OffersErrorImplCopyWithImpl(
      _$OffersErrorImpl _value, $Res Function(_$OffersErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$OffersErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OffersErrorImpl implements OffersError {
  const _$OffersErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OffersState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OffersErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OffersErrorImplCopyWith<_$OffersErrorImpl> get copyWith =>
      __$$OffersErrorImplCopyWithImpl<_$OffersErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<OfferModel> offers) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<OfferModel> offers)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<OfferModel> offers)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(OffersLoading value) loading,
    required TResult Function(OffersSuccess value) success,
    required TResult Function(OffersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(OffersLoading value)? loading,
    TResult? Function(OffersSuccess value)? success,
    TResult? Function(OffersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(OffersLoading value)? loading,
    TResult Function(OffersSuccess value)? success,
    TResult Function(OffersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OffersError implements OffersState {
  const factory OffersError(final String message) = _$OffersErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$OffersErrorImplCopyWith<_$OffersErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
