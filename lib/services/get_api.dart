import 'dart:convert';
import 'package:http/http.dart' as http;

class GetApi {
  dynamic MyToken = '';
  String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=';
  String partofUrl = '&appid=';
  String defaultUrl = '&units=metric';
  Future<dynamic> getData(String country) async {
    Uri url = Uri.parse(baseUrl + country + partofUrl + MyToken + defaultUrl);
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }

  double getTemperature(dynamic decoded) => decoded["main"]["temp"];
  double getWindSpeed(dynamic decoded) => decoded["wind"]["speed"];
  double getHumidity(dynamic decoded) => decoded["main"]["humidity"];
  double getPressure(dynamic decoded) => decoded["main"]["pressure"];
  double getFeelsLike(dynamic decoded) => decoded["main"]["feels_like"];
  String getWeatherStatus(dynamic decoded) => decoded["weather"][0]["main"];
  String getCountryName(dynamic decoded) => decoded["name"];
}
