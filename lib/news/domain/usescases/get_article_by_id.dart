import 'package:injectable/injectable.dart';

import '../../data/models/article.dart';
import '../repositories/abstract_news_repository.dart';

@injectable
class GetArticleById {
  final AbstractNewsRepository repository;

  GetArticleById(this.repository);
  Future<Article> getArticleById(String articleId) async {
    return await repository.getArticle(articleId);
  }
}
