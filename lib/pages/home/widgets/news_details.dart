import 'package:flutter/material.dart';
import 'package:news/pages/home/widgets/tab_bar_item.dart';

import '../../../models/source_model.dart';
import 'news_article_list.dart';

class NewsDetails extends StatefulWidget {
  final SourceModel sourceModel;
  const NewsDetails({
    super.key,
    required this.sourceModel,
  });

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceModel.sources.length,
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
            tabs: widget.sourceModel.sources
                .map(
                  (e) => TabBarItem(
                    title: e.name,
                    isSelected:
                        selectedIndex == widget.sourceModel.sources.indexOf(e),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: NewsArticleList(
              source: widget.sourceModel.sources[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
