import 'package:bmindex/icon_content.dart';
import 'package:bmindex/result_page.dart';
import 'resusable_card.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🍕 Bmindex', style: TextStyle(
          fontSize: 18.0,
          color: Colors.white
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'male')
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                     onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'female')
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child:  ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height', style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle,),
                      Text(' cm', style: kLabelTextStyle,),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(), 
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    min: 100.0,
                    max: 220.0,
                    activeColor: kActiveCardColor,
                    inactiveColor: Colors.white24,
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus, 
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }
                            ),
                            SizedBox(width: 8.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('age', style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus, 
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }
                            ),
                            SizedBox(width: 8.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }
                            )
                          ],
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                CalculatorBrain calc = new CalculatorBrain(weight: weight, height: height);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(), 
                  resultText: calc.getResult(), 
                  interpretation: calc.getInterpretation(),
                )));
              },
              child: Text('Calculate', style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      child: Center(child: Icon(icon, size: 18.0,)),
    );
  }
}
