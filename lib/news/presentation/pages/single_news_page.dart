import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors/app_colors.dart';
import '../bloc/news_bloc.dart';

class SingleNewsPage extends StatefulWidget {
  const SingleNewsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SingleNewsPage> createState() => _SingleNewsPageState();
}

class _SingleNewsPageState extends State<SingleNewsPage> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(
      GetSingleNewsEvent(ModalRoute.of(context)!.settings.arguments as String),
    );
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        buildWhen: (previous, current) =>
            current is SingleNewsLoading || current is SingleNewsLoaded,
        builder: (context, state) {
          if (state is SingleNewsLoading) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is SingleNewsLoaded) {
            return CustomScrollView(
              slivers: <Widget>[
                ExtendedSliverAppbar(
                  title: Text(
                    state.article.title,
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: AppColors.basicHeaderColor),
                  ),
                  mainAxisAlignment: MainAxisAlignment.start,
                  leading: const BackButton(
                    onPressed: null,
                    color: Colors.white,
                  ),
                  toolBarColor: Colors.transparent,
                  background: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: state.article.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 300),
                      PositionedDirectional(
                        start: 48,
                        bottom: 40,
                        end: 48,
                        child: Text(
                          state.article.title,
                          style: Theme.of(context).textTheme.headline1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                    child: Column(
                  children: <Widget>[
                    const SizedBox(height: 22),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 22),
                        Expanded(
                          child: Text(
                            state.article.description ?? "",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const SizedBox(width: 22),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 22),
                        Expanded(
                          child: Text(
                            state.article.description ?? "",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const SizedBox(width: 22),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 22),
                        Expanded(
                          child: Text(
                            state.article.description ?? "",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        const SizedBox(width: 22),
                      ],
                    ),
                  ],
                )),
              ],
            );
          } else {
            return const Offstage();
          }
        },
      ),
    );
  }
}
