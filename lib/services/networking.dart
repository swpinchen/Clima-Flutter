import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = '';

class NetworkHelper {
  NetworkHelper({this.latitude, this.longitude, this.cityName});
  final String? latitude;
  final String? longitude;
  final String? cityName;

  Future getData() async {
    var url;
    if (cityName == null) {
      url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
        'lat': latitude,
        'lon': longitude,
        'units': "metric",
        'appid': apiKey
        });
    } else {
      url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
        'q': cityName,
        'units': "metric",
        'appid': apiKey
      });
    }

    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
