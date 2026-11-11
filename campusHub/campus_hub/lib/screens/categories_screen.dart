import 'package:flutter/material.dart';
import 'package:campus_hub/data/dummy_data.dart';
import 'package:campus_hub/models/activity_category.dart';
import 'package:campus_hub/screens/activities_screen.dart';
import 'package:campus_hub/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, ActivityCategory category) {
    final filteredActivities = dummyActivities
        .where((activity) => activity.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ActivitiesScreen(
          title: category.title,
          activities: filteredActivities,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 3 : 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          )
      ],
    );
  }
}