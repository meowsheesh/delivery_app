
import 'package:bloc/bloc.dart';
import 'package:delivery_test/domain/entities/points.dart';
import 'package:delivery_test/domain/usecases/get_points_info.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data_state.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetPointsUseCase _getPointsUseCase;
  HomePageBloc(this._getPointsUseCase) : super(HomePageLoading()) {
    on<InitializeHomeEvent>(_init);
  }

  void _init(InitializeHomeEvent event, Emitter<HomePageState> emmiter) async {



    final dataState = await _getPointsUseCase();
    if(dataState is DataSuccess && dataState.data != null){
      List<PointsEntity> mockData = [
        PointsEntity(
          id: 0,
          name: 'Проспект ленина',
          address: '99 A',
          workingTime: DateTime.now(),
          lat: 59.937942,
          lon: 30.317470,
        ),
        PointsEntity(
          id: 1,
          name: 'ул. Гагарина',
          address: '44',
          workingTime: DateTime.now(),
          lat: 59.937822,
          lon: 30.304487,
        ),
        PointsEntity(
          id: 2,
          name: 'Наб. обводного канала',
          address: '74 Ц',
          workingTime: DateTime.now(),
          lat: 59.941010,
          lon: 30.303658,
        ),
      ];
      //emit(HomePageReadyState(dataState.data!));
      emit(HomePageReadyState(mockData));
    }
    if(dataState is DataFailed){
      emit(HomePageErrorState(dataState.exception!));
    }
  }
}
