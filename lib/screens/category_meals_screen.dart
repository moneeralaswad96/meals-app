import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:meals/provider/meal_provider.dart';


import '../widgets/meal_item.dart';
import '../models/meal.dart';

import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String categoryId;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  // @override
  // void initState() {
  //   // ...
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final List<Meal> availableMeals =
        Provider.of<meal_provider>(context, listen: false).availableMeals;
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryId = routeArgs['id'].toString();
      displayedMeals = availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            lang.getTexts("cat-$categoryId"),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals[index].id,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
            );
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
