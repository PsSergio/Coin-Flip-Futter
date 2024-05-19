import 'package:flutter/material.dart';

main() {
  runApp(CoinFlipApp());
}

class CoinFlipApp extends StatelessWidget {
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
