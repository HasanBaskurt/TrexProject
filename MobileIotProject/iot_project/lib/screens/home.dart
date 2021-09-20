import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "IOT PROJECT",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor:Color(0xff2c2c2c),
            title: Text("IOT PROJECT"),
            centerTitle: true,
            shadowColor: Colors.red,
          ),
          body: appFunc(),
        ));
  }
}
class appFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20.0),
          color:Color(0xff2c2c2c),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    'RGB LED CONTROL',
                    style: TextStyle(
                      fontFamily: 'Satisfy',
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Directionality(
                    child: GreenLedButton(),
                    textDirection: TextDirection.ltr,
                  ),
                  Directionality(
                    child: RedLedButton(),
                    textDirection: TextDirection.ltr,
                  ),
                  Directionality(
                    child: BlueLedButton(),
                    textDirection: TextDirection.ltr,
                  ),
                  Directionality(
                    child: CloseLedButton(),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Directionality(
                    child: Text(''),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Text(
                    'SOCKET CONTROLLER',
                    style: TextStyle(
                      fontFamily: 'Satisfy',
                      fontSize: 20,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  
                  Directionality(
                    child: Text(''),
                    textDirection: TextDirection.ltr,
                  ),
                  Directionality(
                    child: SocketOpenButton(),
                    textDirection: TextDirection.ltr,
                    
                  ),
                  Directionality(
                    child: SocketCloseButton(),
                    textDirection: TextDirection.ltr,
                  ),
                  Directionality(
                    child: Text(''),
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

// Green Led Post
  greenLed() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/green"), body: {}).then((value) {
     print(value);
 }, onError: (error) {
     print(error);
  });
         
    } catch (e) {
      print(e);
    }
  }

  // Red Led Post
  redLed() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/red"), body: {});
    } catch (e) {
      print(e);
    }
  }

  // Blue Led Post
  blueLed() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/blue"), body: {});
    } catch (e) {
      print(e);
    }
  }

  // Close Led Post
  closeLed() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/close"), body: {});
    } catch (e) {
      print(e);
    }
  }

//SOCKET POST CONTROL
  // Close Led Post
  socketOn() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/socketOpen"), body: {});
    } catch (e) {
      print(e);
    }
  }

  // Close Led Post
  socketOff() async {
    try {
      var response = await http
          .post(Uri.parse("http://10.0.2.2:5000/api/socketClose"), body: {});
    } catch (e) {
      print(e);
    }
  }

//RGB LED BUTTONS
class GreenLedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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

//SOCKET BUTTONS
class SocketOpenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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
  @override
  Widget build(BuildContext context) {
    var button = Container(
      width:80.0,
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