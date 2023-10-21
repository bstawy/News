import 'package:flutter/material.dart';

class CategoryModel{
  final String id;
  final String title;
  final String imagePath;
  final Color backgroundColor;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });
}