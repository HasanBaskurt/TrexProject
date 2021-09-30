import 'package:http/http.dart' as http;

// Green Led Post
greenLed() async {
  try {
    // ignore: unused_local_variable
    var response = await http.post(Uri.parse("http://10.0.2.2:5000/api/green"),
        body: {}).then((value) {
      // ignore: avoid_print
      print(value);
    }, onError: (error) {
      // ignore: avoid_print
      print(error);
    });
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

// Red Led Post
redLed() async {
  try {
    // ignore: unused_local_variable
    var response =
        await http.post(Uri.parse("http://10.0.2.2:5000/api/red"), body: {});
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

// Blue Led Post
blueLed() async {
  try {
    // ignore: unused_local_variable
    var response =
        await http.post(Uri.parse("http://10.0.2.2:5000/api/blue"), body: {});
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

// Close Led Post
closeLed() async {
  try {
    // ignore: unused_local_variable
    var response =
        await http.post(Uri.parse("http://10.0.2.2:5000/api/close"), body: {});
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

//SOCKET POST CONTROL
// Close Led Post
socketOn() async {
  try {
    // ignore: unused_local_variable
    var response = await http
        .post(Uri.parse("http://10.0.2.2:5000/api/socketOpen"), body: {});
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

// Close Led Post
socketOff() async {
  try {
    // ignore: unused_local_variable
    var response = await http
        .post(Uri.parse("http://10.0.2.2:5000/api/socketClose"), body: {});
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

// Teamcity Data API Get
class Api {
  static Future getTeamcities() {
    return http.get(Uri.parse('http://10.0.2.2:5000/api/buildLog'));
  }
}
