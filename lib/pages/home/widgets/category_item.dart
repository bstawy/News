import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Function() onClicked;
  final int index;

  const CategoryItem({
    super.key,
    required this.category,
    required this.onClicked,
    required this.index,
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
          color: category.backgroundColor,
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
              category.imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            Text(
              category.title,
              style: theme.textTheme.titleSmall!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
