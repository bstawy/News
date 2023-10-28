import 'package:flutter/material.dart';
import 'package:news/pages/home/home_view.dart';

import '../home/widgets/custom_drawer.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settings';
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    var theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/background_pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: CustomDrawer(
          title: 'Settings',
          onCategoryClicked: () {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          },
          onSettingsClicked: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: width * 0.08,
              right: width * 0.08,
              top: height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick your category \nof interest',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
