import 'package:coin_flip/default_button.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image: AssetImage('images/cara.png'),),

              Text(
                'Coin Flip',
                style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Cocogoose",
                    fontWeight: FontWeight.w400),
              ),

              Container(
                height: 200,
              ),

              DefaultButtonForApp(
                text: 'SinglePlayer',
                // func: navigateForPage(SinglePlayerPage(), context),
              ),

              Container(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

// void navigateForPage(Page, context){
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder:  (context) => Page())
//   );
// }