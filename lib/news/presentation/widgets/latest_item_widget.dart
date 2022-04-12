import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/util/app_util.dart';
import '../../data/models/article.dart';

class LatestItemWidget extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  const LatestItemWidget({
    Key? key,
    required this.article,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsetsDirectional.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 20,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.1),
            ),
            const BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 0,
              color: Colors.white,
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                            imageUrl: article.imageUrl,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 60,
                          ),
                        ),
                        const SizedBox(width: 23),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                article.title,
                                style: Theme.of(context).textTheme.headline3,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                AppUtil.getTimeAgo(article.publicationDate),
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
