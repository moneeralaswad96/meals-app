import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';

import 'package:splashscreen/splashscreen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen() : super();

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      
        loadingText: const Text(
          'Welcome',
          style: TextStyle(fontSize: 20.0),
        ),
        seconds: 7,
        navigateAfterSeconds: TabsScreen(),
        title: new Text(
          'YOUR MEALS',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.black45),
        ),
        image: Image(
          image: AssetImage(
            'assets/image/R.png',
          ),
         
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.black38);
  }
}
