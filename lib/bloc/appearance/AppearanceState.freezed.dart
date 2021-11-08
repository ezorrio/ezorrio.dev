// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'AppearanceState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppearanceStateTearOff {
  const _$AppearanceStateTearOff();

  Light light() {
    return const Light();
  }

  Dark dark() {
    return const Dark();
  }

  System system() {
    return const System();
  }
}

/// @nodoc
const $AppearanceState = _$AppearanceStateTearOff();

/// @nodoc
mixin _$AppearanceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Light value) light,
    required TResult Function(Dark value) dark,
    required TResult Function(System value) system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppearanceStateCopyWith<$Res> {
  factory $AppearanceStateCopyWith(
          AppearanceState value, $Res Function(AppearanceState) then) =
      _$AppearanceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppearanceStateCopyWithImpl<$Res>
    implements $AppearanceStateCopyWith<$Res> {
  _$AppearanceStateCopyWithImpl(this._value, this._then);

  final AppearanceState _value;
  // ignore: unused_field
  final $Res Function(AppearanceState) _then;
}

/// @nodoc
abstract class $LightCopyWith<$Res> {
  factory $LightCopyWith(Light value, $Res Function(Light) then) =
      _$LightCopyWithImpl<$Res>;
}

/// @nodoc
class _$LightCopyWithImpl<$Res> extends _$AppearanceStateCopyWithImpl<$Res>
    implements $LightCopyWith<$Res> {
  _$LightCopyWithImpl(Light _value, $Res Function(Light) _then)
      : super(_value, (v) => _then(v as Light));

  @override
  Light get _value => super._value as Light;
}

/// @nodoc

class _$Light implements Light {
  const _$Light();

  @override
  String toString() {
    return 'AppearanceState.light()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Light);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return light();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return light?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Light value) light,
    required TResult Function(Dark value) dark,
    required TResult Function(System value) system,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class Light implements AppearanceState {
  const factory Light() = _$Light;
}

/// @nodoc
abstract class $DarkCopyWith<$Res> {
  factory $DarkCopyWith(Dark value, $Res Function(Dark) then) =
      _$DarkCopyWithImpl<$Res>;
}

/// @nodoc
class _$DarkCopyWithImpl<$Res> extends _$AppearanceStateCopyWithImpl<$Res>
    implements $DarkCopyWith<$Res> {
  _$DarkCopyWithImpl(Dark _value, $Res Function(Dark) _then)
      : super(_value, (v) => _then(v as Dark));

  @override
  Dark get _value => super._value as Dark;
}

/// @nodoc

class _$Dark implements Dark {
  const _$Dark();

  @override
  String toString() {
    return 'AppearanceState.dark()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Dark);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return dark();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return dark?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Light value) light,
    required TResult Function(Dark value) dark,
    required TResult Function(System value) system,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
  }) {
    return dark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class Dark implements AppearanceState {
  const factory Dark() = _$Dark;
}

/// @nodoc
abstract class $SystemCopyWith<$Res> {
  factory $SystemCopyWith(System value, $Res Function(System) then) =
      _$SystemCopyWithImpl<$Res>;
}

/// @nodoc
class _$SystemCopyWithImpl<$Res> extends _$AppearanceStateCopyWithImpl<$Res>
    implements $SystemCopyWith<$Res> {
  _$SystemCopyWithImpl(System _value, $Res Function(System) _then)
      : super(_value, (v) => _then(v as System));

  @override
  System get _value => super._value as System;
}

/// @nodoc

class _$System implements System {
  const _$System();

  @override
  String toString() {
    return 'AppearanceState.system()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is System);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() light,
    required TResult Function() dark,
    required TResult Function() system,
  }) {
    return system();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
  }) {
    return system?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? light,
    TResult Function()? dark,
    TResult Function()? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Light value) light,
    required TResult Function(Dark value) dark,
    required TResult Function(System value) system,
  }) {
    return system(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
  }) {
    return system?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Light value)? light,
    TResult Function(Dark value)? dark,
    TResult Function(System value)? system,
    required TResult orElse(),
  }) {
    if (system != null) {
      return system(this);
    }
    return orElse();
  }
}

abstract class System implements AppearanceState {
  const factory System() = _$System;
}
