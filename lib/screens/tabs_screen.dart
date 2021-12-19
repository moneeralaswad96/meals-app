import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:meals/provider/meal_provider.dart';
import 'package:meals/screens/connnect_with_us.dart';

import 'package:provider/provider.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';
import 'all_meals.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    print("meals");
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': lang.getTexts('categories')
      },
      {
        'page': FavoritesScreen(),
        'title': lang.getTexts('your_favorites')
      },
      {
        'page': connect_with_us(),
        'title': lang.getTexts('connect_with_us')
      },
      {
        'page': home_page(),
        'title': lang.getTexts('all_food')
      },
    ];

    final List<Meal> favoriteMeals =
        Provider.of<meal_provider>(context, listen: true).favoriteMeals;
    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).canvasColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).canvasColor,
          currentIndex: _selectedPageIndex,
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text(lang.getTexts('categories')),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text(lang.getTexts('your_favorites')),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.all_inclusive),
              title: Text(lang.getTexts('connect_with_us')),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.food_bank),
              title: Text(lang.getTexts('all_food')),
            ),
          ],
        ),
      ),
    );
  }
}
