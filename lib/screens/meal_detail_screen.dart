import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:meals/provider/meal_provider.dart';

import '../dummy_data.dart';

import 'package:provider/provider.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.bodyText1),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 250,
      width: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    List<String> ingredianslist =
        lang.getTexts("ingredients-$mealId") as List<String>;

    List<String> stepslist = lang.getTexts("steps-$mealId") as List<String>;

    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.getTexts('meal-$mealId')),
          actions: [
            TextButton(
              onPressed: () =>
                  Provider.of<meal_provider>(context, listen: false)
                      .toggleFavorite(mealId),
              child: Icon(
                Provider.of<meal_provider>(context, listen: true).isMealFavorite
                    ? Icons.star
                    : Icons.star_border,
                color: Colors.teal[100],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, lang.getTexts('Ingredients')),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(ingredianslist[index])),
                    );
                  },
                  itemCount: ingredianslist.length,
                ),
              ),
              buildSectionTitle(context, lang.getTexts('Steps')),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(
                          stepslist[index],
                        ),
                      ),
                      Divider()
                    ],
                  ),
                  itemCount: stepslist.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Provider.of<meal_provider>(context, listen: true).isMealFavorite
                ? Icons.star
                : Icons.star_border,
          ),
          onPressed: () => Provider.of<meal_provider>(context, listen: false)
              .toggleFavorite(mealId),
        ),
      ),
    );
  }
}
