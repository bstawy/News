import 'package:flutter/material.dart';
import 'package:news/core/network_layer/api_manager.dart';
import '../../../models/article_model.dart';
import '../../../models/source_model.dart';
import 'news_article_item.dart';

class NewsArticleList extends StatelessWidget {
  Source source;

  NewsArticleList({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchArticles(source.id!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Articles> articlesList = snapshot.data?.articles ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) =>
                NewsArticleItem(articles: articlesList[index]),
            itemCount: articlesList.length,
          );
        });
  }
}
