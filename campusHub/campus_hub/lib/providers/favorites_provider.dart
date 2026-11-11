import 'package:flutter/material.dart';
import 'package:campus_hub/models/activity.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Activity> _favoriteActivities = [];

  List<Activity> get favoriteActivities => _favoriteActivities;

  bool isFavorite(Activity activity) {
    return _favoriteActivities.contains(activity);
  }

  void toggleFavoriteStatus(Activity activity) {
    final isExisting = _favoriteActivities.contains(activity);
    if (isExisting) {
      _favoriteActivities.remove(activity);
    } else {
      _favoriteActivities.add(activity);
    }
    notifyListeners();
  }
}
