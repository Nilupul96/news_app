import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/helpers/local_storage.dart';
import 'package:news_app/core/network/net_exception.dart';
import 'package:news_app/features/home/domain/entities/article.dart';
import 'package:news_app/features/home/domain/usecases/get_article.dart';
import '../../../../core/network/net_result.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopArticleUseCase _getArticleUseCase;

  HomeBloc(this._getArticleUseCase) : super(HomeLoading()) {
    on<GetTopArticles>(onGetTopArticle);
    on<SetHomeScreenLoading>(setHomeScreenLoading);
    on<SetUserCountryCode>(setUserCountryCode);
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

  void setUserCountryCode(
      SetUserCountryCode event, Emitter<HomeState> emit) async {
    emit(CountrySaveLoading());
    try {
      await LocalStorage().setCountryCode(event.countryCode);
      emit(CountrySaveSuccess(
          countryName: event.countryName, countryCode: event.countryCode));
    } catch (e) {
      emit(CountrySaveError(error: "Country save Error $e"));
    }
  }
}
