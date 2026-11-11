import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/providers/favorites_provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFav = favoritesProvider.isFavorite(activity);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: TextButton.icon(
        key: ValueKey<bool>(isFav),
        onPressed: () {
          favoritesProvider.toggleFavoriteStatus(activity);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isFav ? 'Removed from favorites' : 'Added to favorites!',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        icon: Icon(
          isFav ? Icons.favorite : Icons.favorite_border,
          color: isFav ? Colors.red : Colors.grey,
        ),
        label: Text(
          isFav ? 'Favorited' : 'Favorite',
          style: TextStyle(
            color: isFav ? Colors.red : Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}