import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:coin_flip/single_player.dart';

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
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.red,),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: AssetImage('images/cara.png'),),

            Text(
              'Coin Flip',
              style: TextStyle(fontSize: 40.0, fontFamily: "Cocogoose", fontWeight: FontWeight.w400),
              ),

            ElevatedButton( // func to navigate to other page
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:  (context) => SinglePlayerPage())
                );
              },
              child: Text('Single Player'),
            ),

            ElevatedButton( // func to navigate to other page
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder:  (context) => SinglePlayerPage())
                // );
              },
              child: Text('2 Players'),
            )
          ],
        
        ),
      )
    );
  }
}
