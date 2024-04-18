import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:mealsapp/data/dummy_data.dart';
import 'package:mealsapp/screens/meals.dart';
import 'package:mealsapp/widgets/category_grid_item.dart';
import 'package:mealsapp/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCatagory(BuildContext context, Categorymodel category) {
    final filterdMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, meals: filterdMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCatagory(context, category);
              },
            )
        ],
      ),
    );
  }
}
