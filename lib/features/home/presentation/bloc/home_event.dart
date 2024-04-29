part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetTopArticles extends HomeEvent {
  const GetTopArticles();
}

class SetHomeScreenLoading extends HomeEvent {
  const SetHomeScreenLoading();
}

class SetUserCountryCode extends HomeEvent {
  const SetUserCountryCode();
}

class SaveCountyLoading extends HomeEvent {
  const SaveCountyLoading();
}
