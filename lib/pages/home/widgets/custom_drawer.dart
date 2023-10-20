import 'package:flutter/material.dart';
import 'package:news/pages/home/widgets/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
            color: theme.colorScheme.primary,
            child: Center(
              child: Text(
                'News App!',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                DrawerItem(
                  icon: Icons.list_rounded,
                  title: 'Categories',
                  onClicked: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  icon: Icons.settings,
                  title: 'Settings',
                  onClicked: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
