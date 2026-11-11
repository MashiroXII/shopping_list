import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:campus_hub/providers/favorites_provider.dart';
import 'package:campus_hub/widgets/activity_card.dart';
import 'package:campus_hub/screens/activity_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) {
        final favoriteActivities = favoritesProvider.favoriteActivities;

        if (favoriteActivities.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'No favorite activities yet.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Start exploring activities!',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: favoriteActivities.length,
          itemBuilder: (ctx, index) {
            final activity = favoriteActivities[index];
            return ActivityCard(
              activity: activity,
              onSelectActivity: (selectedActivity) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ActivityDetailScreen(activity: selectedActivity),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}