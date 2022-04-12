// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'news/data/repositories/mock_news_repository.dart' as _i4;
import 'news/domain/repositories/abstract_news_repository.dart' as _i3;
import 'news/domain/usescases/get_article_by_id.dart' as _i5;
import 'news/domain/usescases/get_featured_articles.dart' as _i6;
import 'news/domain/usescases/get_latest_articles.dart' as _i7;
import 'news/presentation/bloc/news_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AbstractNewsRepository>(() => _i4.MockNewsRepository());
  gh.factory<_i5.GetArticleById>(
      () => _i5.GetArticleById(get<_i3.AbstractNewsRepository>()));
  gh.factory<_i6.GetFeaturedArticles>(
      () => _i6.GetFeaturedArticles(get<_i3.AbstractNewsRepository>()));
  gh.factory<_i7.GetLatestArticles>(
      () => _i7.GetLatestArticles(get<_i3.AbstractNewsRepository>()));
  gh.factory<_i8.NewsBloc>(() => _i8.NewsBloc(get<_i7.GetLatestArticles>(),
      get<_i6.GetFeaturedArticles>(), get<_i5.GetArticleById>()));
  return get;
}
