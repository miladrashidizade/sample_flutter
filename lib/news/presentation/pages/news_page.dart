import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/news_bloc.dart';
import '../widgets/featured_item_widget.dart';
import '../widgets/latest_item_widget.dart';
import 'single_news_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsBloc _newsBloc;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _newsBloc = BlocProvider.of<NewsBloc>(context);
      _newsBloc.add(GetNewsEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    _newsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headline3,
        ),
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        actions: [
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Fluttertoast.showToast(
                  msg: "All notifications marked read",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(end: 18),
                child: Text(
                  'Mark all read',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        buildWhen: (previous, current) =>
            current is NewsLoading || current is NewsLoaded,
        builder: (context, state) {
          if (state is NewsLoading) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [CircularProgressIndicator()],
              ),
            );
          } else if (state is NewsLoaded) {
            return ListView(
              children: [
                const SizedBox(height: 18),
                Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Featured',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 350.0, autoPlay: true, viewportFraction: 1),
                  items: state.featuredArticles.map((article) {
                    return Builder(
                      builder: (BuildContext context) {
                        return FeaturedItemWidget(
                          article: article,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SingleNewsPage(),
                                settings: RouteSettings(
                                  arguments: article.id,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Latest news',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                ListView.builder(
                  padding: const EdgeInsetsDirectional.only(
                    start: 18,
                    end: 18,
                  ),
                  shrinkWrap: true,
                  itemCount: state.latestArticles.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => LatestItemWidget(
                    article: state.latestArticles[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SingleNewsPage(),
                          settings: RouteSettings(
                            arguments: state.latestArticles[index].id,
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
