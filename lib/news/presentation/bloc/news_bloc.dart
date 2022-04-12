import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../data/models/article.dart';
import '../../domain/usescases/get_article_by_id.dart';
import '../../domain/usescases/get_featured_articles.dart';
import '../../domain/usescases/get_latest_articles.dart';

part 'news_event.dart';
part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(
    GetLatestArticles getLatestArticles,
    GetFeaturedArticles getFeaturedArticles,
    GetArticleById getArticleById,
  ) : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(NewsLoading());
      await Future.delayed(
        const Duration(seconds: 1),
        (() async {}),
      );

      emit(
        NewsLoaded(
          featuredArticles: await getFeaturedArticles.getFeaturedArticles(),
          latestArticles: await getLatestArticles.getLatestArticles(),
        ),
      );
    });

    // Single news
    on<GetSingleNewsEvent>((event, emit) async {
      emit(SingleNewsLoading());
      await Future.delayed(
        const Duration(seconds: 1),
        (() async {}),
      );

      emit(
        SingleNewsLoaded(
          article: await getArticleById.getArticleById(event.articleId),
        ),
      );
    });
  }
}
