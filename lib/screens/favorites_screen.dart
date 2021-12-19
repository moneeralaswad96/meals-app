import 'package:flutter/material.dart';

import 'package:meals/provider/language_provider.dart';
import 'package:meals/provider/meal_provider.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);

    final List<Meal> favoriteMeals =
        Provider.of<meal_provider>(context, listen: false).favoriteMeals;
    if (favoriteMeals.isEmpty) {
      return Directionality(
        textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
        child: Center(
          child: Text(lang.getTexts('favorites_text')),
        ),
      );
    } else {
      return Directionality(
          textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
          child: Center(
              child: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
               
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                affordability: favoriteMeals[index].affordability,
                complexity: favoriteMeals[index].complexity,
              );
            },
            itemCount: favoriteMeals.length,
          )));
    }
  }
}
