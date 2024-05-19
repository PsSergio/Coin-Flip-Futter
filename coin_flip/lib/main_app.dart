import 'package:coin_flip/home_page.dart';
import 'package:flutter/material.dart';

  // nao sofrem modificação dinamica (requisicao API, variáveis... etc etc)
class MainApp extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false, // false to hidde debug flag
      
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
      ),

      home: HomePage(),
    );
  }
}

