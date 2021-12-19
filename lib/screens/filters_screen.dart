import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:meals/provider/meal_provider.dart';


import '../widgets/main_drawer.dart';

import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  var a=1;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final Map<String, bool> currentFilters =
        Provider.of<meal_provider>(context, listen: false).filters;

    var lang = Provider.of<LanguageProvider>(context, listen: true);

    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(lang.getTexts("filters_appBar_title")),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                lang.getTexts("filters_screen_title"),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    lang.getTexts('Gluten-free'),
                    lang.getTexts('Gluten-free-sub'),
                    currentFilters['gluten'],
                    (newValue) {
                      setState(
                        () {
                          currentFilters['gluten'] = newValue;
                        },
                      );
                      Provider.of<meal_provider>(context, listen: false)
                          .setFilters();
                    },
                  ),
                  _buildSwitchListTile(
                    lang.getTexts('Lactose-free'),
                    lang.getTexts('Lactose-free_sub'),
                    currentFilters['lactose'],
                    (newValue) {
                      setState(
                        () {
                          currentFilters['lactose'] = newValue;
                        },
                      );
                      Provider.of<meal_provider>(context, listen: false)
                          .setFilters();
                    },
                  ),
                  _buildSwitchListTile(
                    lang.getTexts('Vegetarian'),
                    lang.getTexts('Vegetarian-sub'),
                    currentFilters['vegetarian'] ,
                    (newValue) {
                      setState(
                        () {
                          currentFilters['vegetarian'] = newValue;
                        },
                      );
                      Provider.of<meal_provider>(context, listen: false)
                          .setFilters();
                    },
                  ),
                  _buildSwitchListTile(
                  lang.getTexts('Vegan'),
                   lang.getTexts('Vegan-sub'), 
                    currentFilters['vegan'],
                    (newValue) {
                      setState(
                        () {
                          currentFilters['vegan'] = newValue;
                        },
                      );
                      Provider.of<meal_provider>(context, listen: false)
                          .setFilters();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
