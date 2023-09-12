import 'package:equatable/equatable.dart';

class PointsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final DateTime? workingTime;
  final double? lat;
  final double? lon;

  const PointsEntity(
      {this.id,
        this.name,
        this.address,
        this.workingTime,
        this.lat,
        this.lon,});

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    workingTime,
    lat,
    lon,
  ];
}