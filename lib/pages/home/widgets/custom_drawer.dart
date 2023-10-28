import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/pages/home/home_view.dart';
import 'package:news/pages/home/widgets/drawer_item.dart';

import '../../settings/settings_view.dart';

class CustomDrawer extends StatelessWidget {
  final String? title;
  Function onCategoryClicked;
  Function onSettingsClicked;
  CustomDrawer({
    super.key,
    this.title,
    required this.onCategoryClicked,
    required this.onSettingsClicked,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    var theme = Theme.of(context);

    return Container(
      width: width * 0.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: height * 0.1265,
            width: width,
            alignment: Alignment.center,
            color: theme.colorScheme.primary,
            child: Text(
              (title != null)
                  ? title!
                  : 'News App!',
              style: theme.textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    onCategoryClicked();
                  },
                  child: const DrawerItem(
                    icon: Icons.list_rounded,
                    title: 'Categories',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    onSettingsClicked();
                  },
                  child: const DrawerItem(
                    icon: Icons.settings,
                    title: 'Settings',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
