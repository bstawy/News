import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Function() onClicked;
  const DrawerItem({super.key, required this.icon, required this.title, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          const SizedBox(width: 10,),
          Text(title, style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }
}
