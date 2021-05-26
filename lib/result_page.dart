import 'package:flutter/material.dart';
import 'resusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  Color getColor() {
    if(resultText == 'UNDER WEIGHT'){
      return Colors.blue;
    } else if(resultText == 'NORMAL') {
      return Colors.greenAccent[400];
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 8.0),
                child: Text('Your result', style: TextStyle(
                  fontSize: 32.0,
                ),),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: ReusableCard(
                  colour: kInactiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(resultText, style: TextStyle(
                        fontSize: 18.0,
                        color: getColor(),
                        fontWeight: FontWeight.bold
                      ),),
                      Text(bmiResult, style: TextStyle(
                        fontSize: 80.0,
                      ),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(interpretation, 
                        style: TextStyle(
                          fontSize: 16.0,
                        ),),
                      ),
                    ],
                  ),
                ),
                height: 300.0,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Recalculate', style: TextStyle(
                    fontSize: 18.0
                  ),),
                ),
                width: double.infinity,
                height: 64.0,
                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: kBottomContainerColor,
                ),    
              ),
            ),
          ],
        ),
      )
    );
  }
}

