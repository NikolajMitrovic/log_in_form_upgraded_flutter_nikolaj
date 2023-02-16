import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:log_in_form_flutter/data/weather.dart';

class HttpHelper {
  // https://api.openweathermap.org/data/2.5/
  // weather?q=Banjaluka&appid=bb540b76b2fa53c54b0ad4eecfba9f75
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '91afc4cabcbe2c92527e63d01ae984a0';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(
      authority,
      path,
      parameters,
    );
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = jsonDecode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
