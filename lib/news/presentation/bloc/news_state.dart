part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> latestArticles;
  final List<Article> featuredArticles;

  NewsLoaded({
    required this.latestArticles,
    required this.featuredArticles,
  });
}

class SingleNewsLoading extends NewsState {}

class SingleNewsLoaded extends NewsState {
  final Article article;

  SingleNewsLoaded({required this.article});
}
