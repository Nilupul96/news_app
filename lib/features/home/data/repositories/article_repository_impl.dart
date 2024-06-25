import 'package:news_app/core/network/net_result.dart';
import 'package:news_app/features/home/data/datasources/article_service.dart';
import 'package:news_app/features/home/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleService _articleService;

  ArticleRepositoryImpl(ArticleService articleService)
      : _articleService = articleService;

  @override
  Future<Result> getTopArticles() async {
    return await _articleService.fetchTopArticle();
  }

  @override
  Future<Result> getAllArticles(
      {String? searchQuery, int? page, String? countryCode}) async {
    return await _articleService.fetchAllArticle(
        searchQuery: searchQuery, page: page, countryCode: countryCode);
  }
}
