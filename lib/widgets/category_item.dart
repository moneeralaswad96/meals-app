import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:provider/provider.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String image;

  CategoryItem(this.id, this.image);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image,
                
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              color: Colors.white70,
              child: Text(
                lang.getTexts("cat-$id").toString(),
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ],
        ));
  }
}

// Container(
//         padding: const EdgeInsets.all(15),
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.title,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
