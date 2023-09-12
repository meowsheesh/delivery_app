// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'points_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointModel _$PointModelFromJson(Map<String, dynamic> json) {
  return _PointModel.fromJson(json);
}

/// @nodoc
mixin _$PointModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  DateTime? get workingTime => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointModelCopyWith<PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointModelCopyWith<$Res> {
  factory $PointModelCopyWith(
          PointModel value, $Res Function(PointModel) then) =
      _$PointModelCopyWithImpl<$Res, PointModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      DateTime? workingTime,
      double? lat,
      double? lon});
}

/// @nodoc
class _$PointModelCopyWithImpl<$Res, $Val extends PointModel>
    implements $PointModelCopyWith<$Res> {
  _$PointModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? workingTime = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      workingTime: freezed == workingTime
          ? _value.workingTime
          : workingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointModelCopyWith<$Res>
    implements $PointModelCopyWith<$Res> {
  factory _$$_PointModelCopyWith(
          _$_PointModel value, $Res Function(_$_PointModel) then) =
      __$$_PointModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      DateTime? workingTime,
      double? lat,
      double? lon});
}

/// @nodoc
class __$$_PointModelCopyWithImpl<$Res>
    extends _$PointModelCopyWithImpl<$Res, _$_PointModel>
    implements _$$_PointModelCopyWith<$Res> {
  __$$_PointModelCopyWithImpl(
      _$_PointModel _value, $Res Function(_$_PointModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? workingTime = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$_PointModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      workingTime: freezed == workingTime
          ? _value.workingTime
          : workingTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointModel implements _PointModel {
  _$_PointModel(
      {this.id, this.name, this.address, this.workingTime, this.lat, this.lon});

  factory _$_PointModel.fromJson(Map<String, dynamic> json) =>
      _$$_PointModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final DateTime? workingTime;
  @override
  final double? lat;
  @override
  final double? lon;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      __$$_PointModelCopyWithImpl<_$_PointModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointModelToJson(
      this,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

abstract class _PointModel implements PointModel {
  factory _PointModel(
      {final int? id,
      final String? name,
      final String? address,
      final DateTime? workingTime,
      final double? lat,
      final double? lon}) = _$_PointModel;

  factory _PointModel.fromJson(Map<String, dynamic> json) =
      _$_PointModel.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  DateTime? get workingTime;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$_PointModelCopyWith<_$_PointModel> get copyWith =>
      throw _privateConstructorUsedError;
}
