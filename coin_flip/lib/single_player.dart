import 'package:coin_flip/Models/CoinModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SinglePlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SinglePlayerPageState();
  }
}

class SinglePlayerPageState extends State<SinglePlayerPage> with TickerProviderStateMixin {
  String selectedValue = 'Cara';

  List possibleValues = ['Cara', 'Coroa'];

  bool coinVisible = false;

  late final AnimationController _controller;
  late final AnimationController _confettiController;
  
  String assetImage = 'images/cara.png' ; 

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Durations.extralong4);
    _confettiController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _controller.dispose();
    _confettiController.dispose();
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
        child: Stack(
          children: [

            _confettiAnimation(),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            
                Stack(
                  children: [
                    Center(child: Visibility(visible: !coinVisible, child: _coinAnimation())),
                    Center(child: Visibility(visible: coinVisible, child: Image.asset(assetImage, width: 240, height: 250,))),
                  ],
                ),
            
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
                        newCoin.sortSide();
                      
                        setState(() {
                          assetImage = 'images/${newCoin.sortedSide.toLowerCase()}.png'; 
                          coinVisible = true;
                        });

                        // userWin = true;
            
                        if (newCoin.validatesUserPlay()){
                          // confetti animation
                          var confettiTicket = _confettiController.forward();
                          await confettiTicket.whenComplete((){_confettiController.reset();});
                          
                        }else{

                          await Future.delayed(Duration(seconds: 2));

                        }

                        setState(() {
                          coinVisible = false;
                        });
            
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
                        backgroundColor: Color.fromRGBO(248, 72, 72, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _confettiAnimation(){
    return Container(
      child: Lottie.asset(
        controller: _confettiController,
        'assets/animations/confetti.json',
        repeat: false,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        fit: BoxFit.cover,
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
          height: 250,
          repeat: false,
          
        ),
        quarterTurns: 2,
      ),
    );
  }

  
}

class ImageCoinWidget extends StatelessWidget {  @override
  final String assetImage;

  const ImageCoinWidget({super.key, required this.assetImage});

  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(assetImage, width: 240, height: 250,);

  }
}