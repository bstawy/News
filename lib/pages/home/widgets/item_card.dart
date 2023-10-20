import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Color color;
  final String title;
  final String imagePath;
  final int index;
  final Function() onClicked;
  const ItemCard({
    super.key,
    required this.color,
    required this.title,
    required this.imagePath,
    required this.index,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var width = mediaQuery.width;
    var height = mediaQuery.height;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        onClicked();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25),
            topRight: const Radius.circular(25),
            bottomLeft: (index % 2 == 0)
                ? const Radius.circular(0)
                : const Radius.circular(25),
            bottomRight: ((index % 2) == 0)
                ? const Radius.circular(25)
                : const Radius.circular(0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: theme.textTheme.titleSmall!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
