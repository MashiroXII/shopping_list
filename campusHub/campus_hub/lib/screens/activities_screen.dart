import 'package:flutter/material.dart';
import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/screens/activity_detail_screen.dart';
import 'package:campus_hub/widgets/activity_card.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.title,
    required this.activities,
  });

  final String title;
  final List<Activity> activities;

  void _selectActivity(BuildContext context, Activity activity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ActivityDetailScreen(activity: activity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'No activities available in this category.',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (activities.isNotEmpty) {
      content = ListView.builder(
        itemCount: activities.length,
        itemBuilder: (ctx, index) => ActivityCard(
          activity: activities[index],
          onSelectActivity: (activity) => _selectActivity(context, activity),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}