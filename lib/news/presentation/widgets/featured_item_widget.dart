import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../data/models/article.dart';

class FeaturedItemWidget extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;
  const FeaturedItemWidget({
    Key? key,
    required this.article,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: pageSize.width - 44,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: AppColors.basicTextColor.withOpacity(0.25)),
            ],
            image: DecorationImage(
              image: CachedNetworkImageProvider(article.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const SizedBox(width: 22),
                  Expanded(
                    child: Text(
                      article.title,
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 22),
                ],
              ),
              const SizedBox(
                height: 22,
              )
            ],
          ),
        ),
      ),
    );
  }
}
