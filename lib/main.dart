import 'package:devtoclient/blocs/bloc_module.dart';
import 'package:devtoclient/pages/articles_page.dart';
import 'package:devtoclient/server/server_module.dart';
import 'package:flutter/material.dart';

void main() {
  ServerModule().init();
  BlocsModule().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: ArticlesPage(),
    );
  }
}

