part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState({this.points, this.dioException});

  final List<PointsEntity>? points;
  final DioException? dioException;

  @override
  List<Object> get props => [points!, dioException!];
}

class HomePageLoading extends HomePageState {
}

class HomePageReadyState extends HomePageState {
  const HomePageReadyState(List<PointsEntity> points) : super(points: points);
}

class HomePageErrorState extends HomePageState {
  const HomePageErrorState(DioException error) : super(dioException: error);
}
