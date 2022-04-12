import 'package:injectable/injectable.dart';

import '../../data/models/article.dart';
import '../repositories/abstract_news_repository.dart';

@injectable
class GetLatestArticles {
  final AbstractNewsRepository repository;

  GetLatestArticles(this.repository);
  Future<List<Article>> getLatestArticles() async {
    return await repository.getLatestArticles();
  }
}
