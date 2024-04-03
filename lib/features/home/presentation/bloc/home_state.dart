part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<ArticleEntity>? articleList;
  final NetException? exception;

  const HomeState({this.articleList, this.exception});

  @override
  List<Object> get props => [articleList!];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  const HomeSuccess(List<ArticleEntity> articleList)
      : super(articleList: articleList);
}

class HomeError extends HomeState {
  const HomeError(NetException? exception) : super(exception: exception);
}
