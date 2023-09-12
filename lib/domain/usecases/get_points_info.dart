import 'package:delivery_test/domain/repository/point_repository.dart';

import '../../core/data_state.dart';
import '../../core/usecase.dart';
import '../entities/points.dart';

class GetPointsUseCase
    implements Usecase<DataState<PointsEntity>, void> {
  final PointsRepository _pointsRepository;

  GetPointsUseCase(this._pointsRepository);

  @override
  Future<DataState<PointsEntity>> call({void params}) {
    return _pointsRepository.getPointsInfo();
  }
}