import 'package:equatable/equatable.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/home/domain/repositories/article_repository.dart';
import '../../../../core/network/net_result.dart';

class GetAllArticleUseCase implements UseCase<Result, GetAllArticlesParams> {
  final ArticleRepository _articleRepository;

  GetAllArticleUseCase(this._articleRepository);

  @override
  Future<Result> call({GetAllArticlesParams? params}) {
    return _articleRepository.getAllArticles(
        searchQuery: params?.query,
        page: params?.page,
        countryCode: params?.countryCode);
  }
}

class GetAllArticlesParams extends Equatable {
  final String? query;
  final String? countryCode;
  final int? page;

  const GetAllArticlesParams(this.countryCode, this.query, this.page);
  @override
  List<Object?> get props => [query, countryCode, page];
}
