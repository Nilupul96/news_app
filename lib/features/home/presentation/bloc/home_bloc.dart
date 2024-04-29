import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/network/net_exception.dart';
import 'package:news_app/features/home/domain/entities/article.dart';
import 'package:news_app/features/home/domain/usecases/get_article.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_result.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopArticleUseCase _getArticleUseCase;

  HomeBloc(this._getArticleUseCase) : super(HomeLoading()) {
    on<GetTopArticles>(onGetTopArticle);
    on<SetHomeScreenLoading>(setHomeScreenLoading);
  }

  void onGetTopArticle(GetTopArticles event, Emitter<HomeState> emit) async {
    Result result = await _getArticleUseCase();
    if (result.exception != null) {
      emit(HomeError(result.exception));
    }
    if (result.exception == null) {
      emit(HomeSuccess(result.result));
    }
  }

  void setHomeScreenLoading(
      SetHomeScreenLoading event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
  }
}
