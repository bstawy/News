import 'package:flutter/material.dart';
import 'package:news/pages/home/home_view_model.dart';
import 'package:news/pages/home/widgets/news_article_item.dart';
import 'package:news/pages/home/widgets/tab_bar_item.dart';
import 'package:provider/provider.dart';
import '../../../models/source_model.dart';

class NewsDetails extends StatefulWidget {
  final List<Source> sourcesList;

  const NewsDetails({
    super.key,
    required this.sourcesList,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  late int selectedIndex = 0;
  var vm = HomeViewModel();

  @override
  void initState() {
    vm.getArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => vm,
      builder: (context, child) {
        return Consumer<HomeViewModel>(
          builder: (context, vm, child) {
            return DefaultTabController(
              length: widget.sourcesList.length,
              child: Column(
                children: [
                  TabBar(
                    labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide.none,
                      ),
                    ),
                    isScrollable: true,
                    tabs: widget.sourcesList
                        .map(
                          (e) => TabBarItem(
                            title: e.name,
                            isSelected:
                                selectedIndex == widget.sourcesList.indexOf(e),
                          ),
                        )
                        .toList(),
                  ),
                  vm.articlesList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                              color: theme.colorScheme.primary),
                        )
                      : Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(20),
                            itemBuilder: (context, index) => NewsArticleItem(
                                articles: vm.articlesList[index]),
                            itemCount: vm.articlesList.length,
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
