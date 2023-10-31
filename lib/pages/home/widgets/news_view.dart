import 'package:flutter/material.dart';
import 'package:news/core/network_layer/api_manager.dart';
import 'package:news/models/category_model.dart';

import '../../../models/source_model.dart';
import 'news_details.dart';

class NewsView extends StatefulWidget {
  final CategoryModel categoryModel;
  const NewsView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
        future: ApiManager.fetchSources(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          SourceModel sourceModel = snapshot.data!;
          return NewsDetails(
            sourceModel: sourceModel,
          );
        });
  }
}
