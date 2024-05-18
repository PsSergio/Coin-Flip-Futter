import 'package:flutter/material.dart';

main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true, // false to hidde debug flag
      theme: ThemeData.light(),
      home: Container(
        child: Center(
          child: Text('First Test'),
        ),
      ),
    );
  }
}
