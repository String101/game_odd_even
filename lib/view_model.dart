import 'dart:math';

import 'package:flutter/material.dart';

class viewModel with ChangeNotifier{

Random random = Random();


int _randomNr=0;
int get randomNr=> _randomNr;

int _points=0;
int get  points=>_points;

int _totalTries = 0;
int get totalTries=>_totalTries;

  viewModel(){
    _randomNr=random.nextInt(99) + 1;
    notifyListeners();
  }

  void incrementPoints(){
    _points = _points + 1; 
    setRandomNumber();
  }

  void setRandomNumber(){
    _randomNr=random.nextInt(99) + 1;
    _totalTries=_totalTries+1;
    notifyListeners();
  }

  bool checkEven(int num){
    return num.isEven;
  }
}