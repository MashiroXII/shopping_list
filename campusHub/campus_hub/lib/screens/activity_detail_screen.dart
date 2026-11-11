import 'package:flutter/material.dart';
import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/widgets/favorite_button.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
        actions: [
          FavoriteButton(activity: activity),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: activity.id,
              child: Image.network(
                activity.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 18),
                      const SizedBox(width: 6),
                      Text('${activity.duration} minutes'),
                      const SizedBox(width: 24),
                      const Icon(Icons.place, size: 18),
                      const SizedBox(width: 6),
                      Text(activity.venue),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    activity.description,
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Requirements',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...activity.requirements.map((req) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          children: [
                            const Icon(Icons.fiber_manual_record, size: 8),
                            const SizedBox(width: 8),
                            Text(req),
                          ],
                        ),
                      )),
                  const SizedBox(height: 24),
                  Text(
                    'Benefits',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...activity.benefits.map((benefit) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Row(
                          children: [
                            const Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                            const SizedBox(width: 8),
                            Text(benefit),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}