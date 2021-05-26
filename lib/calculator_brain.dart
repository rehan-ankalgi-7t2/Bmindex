import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.weight, this.height});

  final int weight;
  final int height;
  double _bmi; 

  String calculateBMI(){
    _bmi = weight / pow((height/100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25){
      return 'OVER WEIGHT';
    } else if(_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDER WEIGHT';
    }
  }

  String getInterpretation () {
    if(_bmi >= 25){
      return 'You have higher than normal body weight, try to excersize more 🚴‍♂️';
    } else if(_bmi > 18.5 && _bmi < 25) {
      return 'your body weight is absolutely normal, Good job! 💪';
    } else {
      return 'Your have lower than normal body weight, you can eat a lot 🍗';
    }
  }
}