import 'package:flutter/material.dart';
import 'key-controller.dart';
import 'key-symbol.dart';

abstract class Keys {
  static KeySymbol clear = const KeySymbol('C');
  static KeySymbol longPress = const KeySymbol('longPress');
  static KeySymbol sign = const KeySymbol('±');
  static KeySymbol percent = const KeySymbol('%');
  static KeySymbol divide = const KeySymbol('÷');
  static KeySymbol multiply = const KeySymbol('x');
  static KeySymbol subtract = const KeySymbol('-');
  static KeySymbol add = const KeySymbol('+');
  static KeySymbol equals = const KeySymbol('=');
  static KeySymbol decimal = const KeySymbol('.');

  static KeySymbol zero = const KeySymbol('0');
  static KeySymbol one = const KeySymbol('1');
  static KeySymbol two = const KeySymbol('2');
  static KeySymbol three = const KeySymbol('3');
  static KeySymbol four = const KeySymbol('4');
  static KeySymbol five = const KeySymbol('5');
  static KeySymbol six = const KeySymbol('6');
  static KeySymbol seven = const KeySymbol('7');
  static KeySymbol eight = const KeySymbol('8');
  static KeySymbol nine = const KeySymbol('9');
}

class CalculatorKey extends StatelessWidget {
  CalculatorKey({this.symbol});

  KeySymbol symbol;
  Color tcolor;

  Color get color {
    switch (symbol.type) {
      case KeyType.FUNCTION:
        {
          tcolor = Colors.white;
          return Color(0xff2C7873);
        }
      //return Color.fromARGB(255, 96, 96, 96);

      case KeyType.OPERATOR:
        {
          tcolor = Colors.black;
          return Color(0xffFFBA5A);
        }
      //		return Color.fromARGB(255, 32, 96, 128);

      case KeyType.INTEGER:
        {
          tcolor = Colors.black;
          return Color(0xffffffff);
        }

      default:
        return Color.fromARGB(255, 128, 128, 128);
    }
  }

  static dynamic _fire(CalculatorKey key) => KeyController.fire(KeyEvent(key));

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    double hight = MediaQuery.of(context).size.width / 5;
    TextStyle style = Theme.of(context).textTheme.display1.copyWith(
        color: (symbol.type == KeyType.FUNCTION || symbol.value == '=')
            ? Colors.white
            : Colors.black);
    Color finalcolor;
    finalcolor = (symbol.value == '=') ? Color(0xff52DE97) : color;

    if (symbol.value == '.') {
      style = style.copyWith(color: Colors.black);
      finalcolor = Colors.white;
    }

    return Container(
        width: (symbol == Keys.equals) ? (size * 2) : size,
        //padding: EdgeInsets.all(2),
        height: hight,
        child: RaisedButton
            /*	FlatButton*/ (
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          color: finalcolor,
          elevation: 2,
          child: Text(symbol.value, style: style),
          onPressed: () => _fire(this),
          onLongPress: () {
            print('long press');
            print('$symbol');
            print('${Keys.clear}');

            if (symbol == Keys.clear) {
              print('logic ok');
              this.symbol = Keys.longPress;
              _fire(this);
            }
          },
        ));
  }
}
