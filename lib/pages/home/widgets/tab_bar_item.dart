import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TabBarItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: 120,
      height: 40,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : theme.colorScheme.primary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
