import 'package:delivery_test/domain/entities/points.dart';

import '../../core/data_state.dart';

abstract class PointsRepository {
  Future<DataState<PointsEntity>> getPointsInfo();
}