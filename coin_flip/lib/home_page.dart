import 'package:coin_flip/two_players.dart';
import 'package:coin_flip/single_player.dart';
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

              HomeButtonForApp(
                text: 'SinglePlayer',
                page: SinglePlayerPage(),
              ),

              Container(
                height: 20,
              ),
              
              HomeButtonForApp(text: '2 Players', page: TwoPlayersPage()),

              Container(
                height: 20,
              ),
            ],
          ),
        ));
  }
}

class HomeButtonForApp extends StatelessWidget {
  final String text;
  final Widget page;

  const HomeButtonForApp({super.key, required this.text, required this.page});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          fixedSize: Size(300, 70),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
