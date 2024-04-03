import 'package:get_it/get_it.dart';
import 'package:news_app/features/home/presentation/bloc/home_bloc.dart';

import '../features/home/data/datasources/article_service.dart';
import '../features/home/data/repositories/article_repository_impl.dart';
import '../features/home/domain/repositories/article_repository.dart';
import '../features/home/domain/usecases/get_article.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //get articles section
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl<GetArticleUseCase>()));
  sl.registerLazySingleton<GetArticleUseCase>(
      () => GetArticleUseCase(sl<ArticleRepository>()));
  sl.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(sl<ArticleService>()));
  sl.registerLazySingleton<ArticleService>(() => ArticleServiceImpl());
}
