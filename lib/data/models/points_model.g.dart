// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointModel _$$_PointModelFromJson(Map<String, dynamic> json) =>
    _$_PointModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      workingTime: json['workingTime'] == null
          ? null
          : DateTime.parse(json['workingTime'] as String),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PointModelToJson(_$_PointModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'workingTime': instance.workingTime?.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };
