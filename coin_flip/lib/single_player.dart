import 'package:coin_flip/Models/CoinModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SinglePlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SinglePlayerPageState();
  }
}

class SinglePlayerPageState extends State<SinglePlayerPage>
    with SingleTickerProviderStateMixin {
  String selectedValue = 'Cara';

  List possibleValues = ['Cara', 'Coroa'];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Durations.extralong4);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Single Player',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _coinAnimation(),
            Text(
              selectedValue,
              style: TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: 'Cocogoose'),
            ),
            Column(
              children: [
                ElevatedButton(
                  // minSize: 70,
                  // disabledColor: Colors.white,
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      fixedSize: Size(300, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Text(
                    'Escolher o lado',
                    style: TextStyle(fontSize: 20, fontFamily: 'Cocogoose'),
                  ),
                  onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: CupertinoPicker(
                              backgroundColor: Colors.white,
                              itemExtent: 30,
                              scrollController:
                                  FixedExtentScrollController(initialItem: 0),
                              children: [
                                Text(
                                  'Cara',
                                ),
                                Text('Coroa'),
                              ],
                              onSelectedItemChanged: (int value) {
                                setState(() {
                                  selectedValue = possibleValues[value];
                                });
                              },
                            ),
                          )),
                ),
                Container(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    
                    var ticker = _controller.forward();
                    await ticker.whenComplete(() {
                      _controller.reset();
                    });

                    CoinModel newCoin = CoinModel(selectedSide: selectedValue);

                    bool resultsPlay = newCoin.validatesUserPlay();
                    print(newCoin.selectedSide +
                        " - " +
                        newCoin.sortedSide +
                        "\nResultado: ${resultsPlay}");


                  },
                  child: Text("Jogar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Cocogoose',
                      )),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    fixedSize: Size(300, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color.fromRGBO(248, 72, 72, 0.757),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _coinAnimation() {
    return Container(
      child: RotatedBox(
        child: Lottie.asset(
          'assets/animations/coinFlipCustomFinal.json',
          controller: _controller,
          width: 250,
          repeat: false,
        ),
        quarterTurns: 2,
      ),
    );
  }
}
