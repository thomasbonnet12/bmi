import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const ActiveCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColor) {
        maleCardColour = ActiveCardColor;
      } else {
        maleCardColour = inactiveCardColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactiveCardColor) {
        femaleCardColour = ActiveCardColor;
      } else {
        femaleCardColour = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'WOMEN',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: ActiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: ActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: ActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}
