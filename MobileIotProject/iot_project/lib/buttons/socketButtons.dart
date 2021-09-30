import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/apis/api.dart';

//SOCKET BUTTONS
class SocketOpenButton extends StatelessWidget {
  const SocketOpenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/SocketOn.png'),
        onPressed: socketOn,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}

class SocketCloseButton extends StatelessWidget {
  const SocketCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 80.0,
      height: 80.0,
      margin: EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Image.asset('images/SocketOff.png'),
        onPressed: socketOff,
        color: Color(0xff2c2c2c),
      ),
    );
    return button;
  }
}
