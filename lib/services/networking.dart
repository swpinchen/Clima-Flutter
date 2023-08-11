import 'package:http/http.dart' as http;
import 'dart:convert';

String apiKey = '5b1b4192096f88a96749ccac244ece9c';

class NetworkHelper {
  NetworkHelper({required this.latitude, required this.longitude});
  final String latitude;
  final String longitude;

  Future getData() async {
    var url =
    Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude,
      'lon': longitude,
      'units': "metric",
      'appid': apiKey }
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}