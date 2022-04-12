part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNewsEvent extends NewsEvent {}

class GetSingleNewsEvent extends NewsEvent {
  final String articleId;
  GetSingleNewsEvent(this.articleId);
}
