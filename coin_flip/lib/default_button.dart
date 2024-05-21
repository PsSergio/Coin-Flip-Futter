import 'package:flutter/material.dart';

class DefaultButtonForApp extends StatelessWidget {
  final String text;
  // final Future func; 

  const DefaultButtonForApp({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // func;
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          fixedSize: Size(300, 70),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
