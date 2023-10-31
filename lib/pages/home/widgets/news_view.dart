import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/pages/home/widgets/news_details.dart';
import 'package:provider/provider.dart';
import '../home_view_model.dart';

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
  var vm = HomeViewModel();

  @override
  void initState() {
    vm.getSource(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) => NewsDetails(
        sourcesList: vm.sourcesList,
      ),
    );

    /*
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
        });*/
  }
}
