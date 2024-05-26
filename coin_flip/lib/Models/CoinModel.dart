import 'dart:math';

import 'package:coin_flip/Enuns/SideCoinEnum.dart';

class CoinModel{

  final String selectedSide;
  late String sortedSide;

  CoinModel({required this.selectedSide});

  String sortSide(){

    int numRandon = Random().nextInt(2);
    // List<SideCoinEnum> sides = SideCoinEnum.values;

    return (SideCoinEnum.values[numRandon].name).toString();

  }

  bool validatesUserPlay(){

    this.sortedSide = sortSide(); 
    if (this.selectedSide == this.sortedSide){
      return true;
    }
    return false;

  }

}