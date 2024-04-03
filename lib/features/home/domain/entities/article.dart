import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';

class ArticleEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
  final DateTime? publishedAt;
  final Source? source;

  const ArticleEntity(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.content,
      this.source,
      this.publishedAt});

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        urlToImage,
        content,
        publishedAt,
        source
      ];
}
