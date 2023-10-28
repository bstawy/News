import 'package:flutter/material.dart';
import 'package:news/core/network_layer/api_manager.dart';
import 'package:news/models/category_model.dart';

class NewsDetailsView extends StatelessWidget {
  final CategoryModel categoryModel;

  const NewsDetailsView({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    var theme = Theme.of(context);

    return FutureBuilder(
      future: ApiManager.fetchSource(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: EdgeInsets.only(
            left: width * 0.08,
            right: width * 0.08,
            top: height * 0.03,
          ),
          child: Column(
            children: [

            ],
          ),
        );
      },
    );
  }
}
