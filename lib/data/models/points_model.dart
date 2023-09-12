import 'package:delivery_test/domain/entities/points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'points_model.freezed.dart';
part 'points_model.g.dart';

@freezed
class PointModel extends PointsEntity with _$PointModel  {
  factory PointModel({
    int? id,
    String? name,
    String? address,
    DateTime? workingTime,
    double? lat,
    double? lon,
  }) = _PointModel;

  factory PointModel.fromJson(Map<String, dynamic> json) =>
      _$PointModelFromJson(json);
}