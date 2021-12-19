import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';

import 'package:provider/provider.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Theme.of(context).canvasColor,
                child: Text(
                  lang.getTexts('drawer_name'),
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildListTile(
                  lang.getTexts("drawer_item1"), Icons.restaurant, () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
              buildListTile(
                  lang.getTexts("drawer_item2"), Icons.settings, () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              }),
              Divider(
                color: Colors.black87,
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  size: 26,
                ),
                title: Text(
                  lang.getTexts("drawer_switch_title"),
                  style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      lang.getTexts('drawer_switch_item2'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Switch(activeColor: Colors.black,
                      onChanged: (newVal) {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLan(newVal);
                        Navigator.of(context).pop();
                      },
                      value: Provider.of<LanguageProvider>(context, listen: true)
                          .isEn,
                      activeTrackColor: Colors.teal,
                    ),
                    Text(
                      lang.getTexts('drawer_switch_item1'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      
    );
  }
}
