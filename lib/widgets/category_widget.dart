import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline6,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
