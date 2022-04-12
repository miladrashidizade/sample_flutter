import 'package:injectable/injectable.dart';

import '../../data/models/article.dart';
import '../repositories/abstract_news_repository.dart';

@injectable
class GetFeaturedArticles {
  final AbstractNewsRepository repository;

  GetFeaturedArticles(this.repository);
  Future<List<Article>> getFeaturedArticles() async {
    return await repository.getFeaturedArticles();
  }
}
