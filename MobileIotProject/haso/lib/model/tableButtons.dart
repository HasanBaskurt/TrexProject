import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllDataButton extends StatelessWidget {
  const AllDataButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "All Data",
          style: TextStyle(color: Colors.black),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("All Data");
        },
        color: Colors.white,
      ),
    );
    return button;
  }
}

class SequentialButton extends StatelessWidget {
  const SequentialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Sequential",
          style: TextStyle(color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("Sequential");
        },
        color: Colors.grey,
      ),
    );
    return button;
  }
}

class LastestButton extends StatelessWidget {
  const LastestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Lastest",
          style: TextStyle(color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("Lastest");
        },
        color: Colors.black,
      ),
    );
    return button;
  }
}

class RunningButton extends StatelessWidget {
  const RunningButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Running",
          style: TextStyle(color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("Running");
        },
        color: Colors.lightBlue,
      ),
    );
    return button;
  }
}

class FailureButton extends StatelessWidget {
  const FailureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Failure",
          style: TextStyle(color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("Failure");
        },
        color: Colors.redAccent,
      ),
    );
    return button;
  }
}

class SuccessButton extends StatelessWidget {
  const SuccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var button = Container(
      width: 110.0,
      height: 35.0,
      margin: const EdgeInsets.all(5),

      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          "Success",
          style: TextStyle(color: Colors.white),
        ),
        // ignore: avoid_print
        onPressed: () {
          print("Success");
        },
        color: Colors.green,
      ),
    );
    return button;
  }
}
