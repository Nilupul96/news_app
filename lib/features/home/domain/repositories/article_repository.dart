import '../../../../core/network/net_result.dart';

abstract class ArticleRepository {
  Future<Result> getTopArticles();
  Future<Result> getAllArticles();
}
