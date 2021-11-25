import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      theme: ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(fontWeight: FontWeight.bold,color: Colors.black , fontSize: 20,),
              headline4: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
              headline5: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16),
              headline2: TextStyle(fontWeight: FontWeight.w600, color: Colors.black ,fontSize: 22,letterSpacing: 1.2)
              ),
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: Colors.deepOrangeAccent),
      home: HomeScreen(),
    );
  }
}
