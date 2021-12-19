
import 'package:flutter/material.dart';
import 'package:meals/provider/language_provider.dart';
import 'package:provider/provider.dart';

class connect_with_us extends StatefulWidget {
  const connect_with_us() : super();

  @override
  _connect_with_usState createState() => _connect_with_usState();
}

class _connect_with_usState extends State<connect_with_us> {
  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<LanguageProvider>(context, listen: true);
    return Directionality(
      textDirection: lang.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        body: Center(
            child: Text(
          lang.getTexts("connect_with_us"),
          style: Theme.of(context).textTheme.bodyText2,
        )),
      ),
    );
  }
}
