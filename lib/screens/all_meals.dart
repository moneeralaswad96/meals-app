import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';

import 'package:flutter/animation.dart';




class home_page extends StatefulWidget {
 

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  
  

  @override
  Widget build(BuildContext context) {
 
    

    return Scaffold(
      
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(180, 179, 180, 1),
      //   title: Text(
      //     'MENU',
      //     style: new TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //       fontSize: 25.0,
      //       fontFamily: "Source Sans Pro",
      //     ),
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      
      body: null,
    );
  }

  ListView buildListView() {
    return ListView(children: [
      SizedBox(
        height: 10,
      ),
      Text(
        'الوجبات',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal[400],
          fontSize: 35.0,
          fontFamily: "Pacifico",
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 10,
      ),
      CarouselSlider(
          options: CarouselOptions(
            height: 190,
            initialPage: 1,
            pauseAutoPlayInFiniteScroll: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            autoPlayCurve: Curves.easeIn,
          ),
          items: [
            stackSlider('', 12),
            stackSlider("", 6),
            stackSlider("", 7),
            stackSlider("", 9),
            stackSlider(" ", 11),
            stackSlider("", 8),
          ]),
      SizedBox(
        height: 10,
      ),
      Container(
          margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
          child: Divider(
            color: Colors.black54,
            thickness: 4,
          )),
      SizedBox(
        height: 10,
      ),
      Text(
        'المشروبات',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.teal[400],
          fontSize: 30.0,
          fontFamily: "Pacifico",
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 5,
      ),
      // CarouselSlider(
      //     options: CarouselOptions(
      //       autoPlay: true,
      //       pageSnapping: true,
      //       height: 190,
      //       initialPage: 1,
      //       pauseAutoPlayInFiniteScroll: true,
      //       aspectRatio: 16 / 9,
      //       viewportFraction: 0.8,
      //       enlargeCenterPage: true,
      //       autoPlayCurve: Curves.easeIn,
      //     ),
      //     items: [
      //       stackSlider("طبيعي", 12),
      //       stackSlider("بارد", 11),
      //       stackSlider("ساخن", 11),

      //     ]),
    ]);
  }

  Stack stackSlider(String text, int a) {
    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: null,
          child: Container(
            alignment: Alignment.topRight,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(image: AssetImage("assets/image/$a.jpg")),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 40, color: Colors.teal[400], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  }
      List imagelist = [
  'assets/image/6.jpg',
  'assets/image/7.jpg',
  'assets/image/8.jpg',
  'assets/image/9.jpg',
  'assets/image/10.jpg',
  'assets/image/11.jpg',
  'assets/image/12.jpg',
  'assets/image/13.jpg',
];
  



