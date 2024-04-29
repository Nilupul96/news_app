import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/domain/repositories/article_repository.dart';
import '../../../../core/network/net_result.dart';

class GetTopArticleUseCase implements UseCase<Result, void> {
  final ArticleRepository _articleRepository;

  GetTopArticleUseCase(this._articleRepository);

  @override
  Future<Result> call({void params}) {
    return _articleRepository.getTopArticles();
  }
}
