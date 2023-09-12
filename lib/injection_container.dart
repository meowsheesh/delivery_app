import 'package:delivery_test/data/repository/points_repository_impl.dart';
import 'package:delivery_test/domain/repository/point_repository.dart';
import 'package:delivery_test/domain/usecases/get_points_info.dart';
import 'package:delivery_test/presentation/pages/home/bloc/home_page_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/remote/point_api_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  // hotel
  sl.registerSingleton<PointApiService>(PointApiService(sl()));
  sl.registerSingleton<PointsRepository>(PointsRepositoryImpl(sl()));
  sl.registerSingleton<GetPointsUseCase>(GetPointsUseCase(sl()));
  sl.registerFactory<HomePageBloc>(() => HomePageBloc(sl()));
}