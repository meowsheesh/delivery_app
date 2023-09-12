part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class InitializeHomeEvent extends HomePageEvent {

}
