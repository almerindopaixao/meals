import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget(this.category, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(category.title);
  }
}