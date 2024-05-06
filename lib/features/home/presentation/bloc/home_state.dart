part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<ArticleEntity>? topArticleList;
  final NetException? exception;
  final String? countryCode;
  final String? countryName;

  const HomeState({
    this.topArticleList,
    this.exception,
    this.countryCode,
    this.countryName,
  });

  @override
  List<Object> get props => [topArticleList!];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  const HomeSuccess(List<ArticleEntity> articleList)
      : super(topArticleList: articleList);
}

class HomeError extends HomeState {
  const HomeError(NetException? exception) : super(exception: exception);
}

class CountrySaveSuccess extends HomeState {
  const CountrySaveSuccess({String? countryName, String? countryCode})
      : super(countryCode: countryCode, countryName: countryName);
}

class CountrySaveLoading extends HomeState {}

class CountrySaveError extends HomeState {
  final String error;

  const CountrySaveError({required this.error});
}
