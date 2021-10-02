import 'package:http/http.dart' as http;

class Api {
  static Future getTeamcities() {
    return http.get(Uri.parse('http://10.0.2.2:5000/api/buildLog'));
  }

  static Future getTeamcitiesLast() {
    return http.get(Uri.parse('http://10.0.2.2:5000/api/list'));
  }
}
