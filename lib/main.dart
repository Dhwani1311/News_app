import 'package:flutter/material.dart';
import 'package:flutter_app_news/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter API ',
        home: MyHomePage());
  }
}
