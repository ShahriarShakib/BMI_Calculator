import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIProviderData with ChangeNotifier{

  int height = 120;
  int weight = 60;
  int age = 45;

  incrementWeight(){
    weight++;
    notifyListeners();
  }
  decrementWeight(){
    weight--;
    notifyListeners();
  }
  incrementAge(){
    age++;
    notifyListeners();
  }
  decrementAge(){
    age--;
    notifyListeners();
  }

  changeHeight(int value){
    height = value;
    notifyListeners();
  }

  double bmi = 0;
  String? suggation ="";

  calculateBMI(){
    bmi = weight /( (height/100) * (height/100) );
    print('BMI is ${bmi}');
    suggation = interpretBMI();
  }

  String interpretBMI() {
    if(bmi >= 25){
      return 'Over Weight';
    }
    else if(bmi>18.5){
      return 'Normal Weight';
    }
    else{
      return "Under Weight";
    }
  }

}