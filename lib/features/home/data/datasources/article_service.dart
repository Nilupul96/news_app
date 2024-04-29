import 'dart:convert';
import 'package:news_app/core/const/app_const.dart';
import 'package:news_app/core/helpers/local_storage.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net_result.dart';
import '../../../../core/network/net_url.dart';

abstract class ArticleService {
  Future<Result> fetchTopArticle();
}

class ArticleServiceImpl implements ArticleService {
  @override
  Future<Result> fetchTopArticle() async {
    Result result = Result();
    try {
      String? countryCode = await LocalStorage().getCountryCode();
      var net = Net(
          url: URL.GET_TOP_ARTICLE,
          method: NetMethod.GET,
          queryParam: {
            'country': countryCode ?? 'us',
            'apiKey': AppConst.API_KEY
          });
      result = await net.perform();
      if (result.exception == null && result.result != "") {
        result.result = List<ArticleModel>.from(
            jsonDecode(result.result)['articles']
                .map((x) => ArticleModel.fromJson(x)));
      }
      return result;
    } catch (err) {
      Log.err("$err");
      result.exception = NetException(
          message: CommonMessages.WENT_WRONG,
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }

  Future<Result> fetchAllArticles() async {
    Result result = Result();
    try {
      var net = Net(
          url: URL.GET_ALL_ARTICLE,
          method: NetMethod.GET,
          queryParam: {'country': 'us', 'apiKey': AppConst.API_KEY});
      result = await net.perform();
      if (result.exception == null && result.result != "") {
        result.result = List<ArticleModel>.from(
            jsonDecode(result.result)['articles']
                .map((x) => ArticleModel.fromJson(x)));
      }
      return result;
    } catch (err) {
      Log.err("$err");
      result.exception = NetException(
          message: CommonMessages.WENT_WRONG,
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }
}
