import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//http://api.weatherapi.com/v1/forecast.json?key=a1fc9e6c652b4edfaab143006222507&q=Durango&days=5&aqi=no&alerts=no
class WeatherProvider extends ChangeNotifier {
  String _key = "a1fc9e6c652b4edfaab143006222507";
  String _baseURL = "api.weatherapi.com";
  String _q = "Durango";
  String _days = "5";
  String _aqi = "no";
  String _alerts = "no";

  String namelocation = '';
  String localtimelocation = '';

  String todayWeather = '';
  String todayTemp = '';
  String todayDay = '';
  String todayText = '';

  String foretempmax0 = "";
  String foretempmin0 = "";
  String foreicon0 = "";
  String foredate0 = "";
  String foretext0 = "";

  String foretempmax1 = "";
  String foretempmin1 = "";
  String foreicon1 = "";
  String foredate1 = "";
  String foretext1 = "";

  String foretempmax2 = "";
  String foretempmin2 = "";
  String foreicon2 = "";
  String foredate2 = "";
  String foretext2 = "";

  List<dynamic> dataWeather = [];

  WeatherProvider() {
    print("WeatherProvider init");

    this.getOnDisplayWeather();
  }

  getOnDisplayWeather() async {
    var url = Uri.https(this._baseURL, 'v1/forecast.json',
        {"key": _key, "q": _q, "days": _days, "aqi": _aqi, "alerts": _alerts});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final Map<String, dynamic> apiDecoded = json.decode(response.body);

    //Location
    final namel = apiDecoded["location"]["name"];
    final localtimel = apiDecoded["location"]["localtime"];

    //Current Day
    final image1 = apiDecoded["current"]["condition"]["icon"];
    final todayImageLink = "http:" + image1;
    final currentC = apiDecoded["current"]["temp_c"];
    final day = apiDecoded["current"]["last_updated"];
    final text = apiDecoded["current"]["condition"]["text"];
    //forecast
    final date0 = apiDecoded["forecast"]["forecastday"][0]["date"];
    final tempmax0 =
        apiDecoded["forecast"]["forecastday"][0]["day"]["maxtemp_c"];
    final tempmin0 =
        apiDecoded["forecast"]["forecastday"][0]["day"]["mintemp_c"];

    final text0 =
        apiDecoded["forecast"]["forecastday"][0]["day"]["condition"]["text"];

    final date1 = apiDecoded["forecast"]["forecastday"][1]["date"];
    final tempmax1 =
        apiDecoded["forecast"]["forecastday"][1]["day"]["maxtemp_c"];
    final tempmin1 =
        apiDecoded["forecast"]["forecastday"][1]["day"]["mintemp_c"];

    final text1 =
        apiDecoded["forecast"]["forecastday"][1]["day"]["condition"]["text"];

    final date2 = apiDecoded["forecast"]["forecastday"][2]["date"];
    final tempmax2 =
        apiDecoded["forecast"]["forecastday"][2]["day"]["maxtemp_c"];
    final tempmin2 =
        apiDecoded["forecast"]["forecastday"][2]["day"]["mintemp_c"];

    final text2 =
        apiDecoded["forecast"]["forecastday"][2]["day"]["condition"]["text"];

    //Location
    namelocation = namel;
    localtimelocation = localtimel;

    //Current Day
    todayWeather = todayImageLink;
    todayTemp = currentC.toString();
    todayDay = day;
    todayText = text;
    //Forecast
    foretempmax0 = tempmax0.toString();
    foretempmin0 = tempmin0.toString();
    foredate0 = date0;
    foretext0 = text0;

    foretempmax1 = tempmax1.toString();
    foretempmin1 = tempmin1.toString();
    foredate1 = date1;
    foretext1 = text1;
    foretempmax2 = tempmax2.toString();
    foretempmin2 = tempmin2.toString();
    foredate2 = date2;
    foretext2 = text2;

    print(apiDecoded);

    notifyListeners();
  }
}
