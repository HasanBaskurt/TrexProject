import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My First App",
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("RGB LED CONTROL"),
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
          color: Colors.black,
          child: Column(
            children: <Widget>[
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

class GreenLedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text("Green"),
        onPressed: greenLed,
        color: Colors.green,
      ),
    );
    return button;
  }
}

class RedLedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text("Red"),
        onPressed: redLed,
        color: Colors.red,
      ),
    );
    return button;
  }
}

class BlueLedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.all(5),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text("Blue"),
        onPressed: blueLed,
        color: Colors.blue,
      ),
    );
    return button;
  }
}


class CloseLedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.all(5),
      
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text("Close"),
        onPressed: closeLed,
        color: Colors.grey,
      ),
    );
    return button;
  }
}
