import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    // conseguem mudanças dinamicas
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          child: TextButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Text('Clique aqui! ${counter}'),
          ),
        ),
      ),
    );
  }
}