import 'package:coin_flip/homePage.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  // nao sofrem modificação dinamica (requisicao API, variáveis... etc etc)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, // false to hidde debug flag
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}