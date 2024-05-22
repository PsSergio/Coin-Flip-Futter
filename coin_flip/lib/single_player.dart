import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SinglePlayerPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SinglePlayerPageState();
  }

}

class SinglePlayerPageState extends State<SinglePlayerPage>{
  String selectedValue = 'Cara'; 

  List possibleValues = ['Cara', 'Coroa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.red, iconTheme: IconThemeData(color: Colors.white), title: Text('Single Player', style: TextStyle(color: Colors.white, fontSize: 20),),),

      body: Center(
        child: Column(
          children: [

            Image(image: AssetImage('images/cara.png'),),

            CupertinoButton.filled(
              disabledColor: Colors.white,
              child: Text('Escolha o lado:'), 
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    itemExtent: 30,
                    scrollController: FixedExtentScrollController(initialItem: 0),
                    children: [
                      Text('Cara'),
                      Text('Coroa'),
                    ],
                    onSelectedItemChanged: (int value) {setState(() {
                      selectedValue = possibleValues[value];
                    });},
                  ),
                )
              ),
            ),
            Container(height: 40,),

            Text(selectedValue, style: TextStyle(color: Colors.black, fontSize: 30, fontFamily: 'Cocogoose'),),

            // ElevatedButton(onPressed: onPressed, child: child)

          ],),),

      
    );
  }
  
}