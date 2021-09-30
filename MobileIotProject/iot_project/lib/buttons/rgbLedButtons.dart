import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/apis/api.dart';

//RGB LED BUTTONS
class GreenLedButton extends StatelessWidget {
  const GreenLedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/green.png'),
        onPressed: greenLed,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}

class RedLedButton extends StatelessWidget {
  const RedLedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/red.png'),
        onPressed: redLed,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}

class BlueLedButton extends StatelessWidget {
  const BlueLedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/blue.png'),
        onPressed: blueLed,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}

class CloseLedButton extends StatelessWidget {
  const CloseLedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/close.png'),
        onPressed: closeLed,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}
