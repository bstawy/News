import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          size: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(title, style: theme.textTheme.titleMedium),
      ],
    );
  }
}
