import 'dart:io';

import 'package:delivery_test/data/data_sources/remote/point_api_service.dart';
import 'package:delivery_test/domain/repository/point_repository.dart';
import 'package:dio/dio.dart';

import '../../core/data_state.dart';
import '../models/points_model.dart';

class PointsRepositoryImpl implements PointsRepository {
  final PointApiService _pointApiService;
  PointsRepositoryImpl(this._pointApiService);

  @override
  Future<DataState<PointModel>> getPointsInfo() async {
    try {
      final httpResponse = await _pointApiService.getPointsInfo();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}