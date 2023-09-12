import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/points_model.dart';

part 'point_api_service.g.dart';

@RestApi(baseUrl: 'https://mocki.io/v1')
abstract class PointApiService {
  factory PointApiService(Dio dio) = _PointApiService;

  @GET('/de5d0b7f-827c-4184-8e3f-a1a2bdee9e6d')
  Future<HttpResponse<PointModel>> getPointsInfo();
}