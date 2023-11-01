import 'package:weathero/services/networking.dart';
import 'package:weathero/services/location.dart';

const String apiKey = "ef1f252d58a28bfb697c2885e0336eaa";
const String openWeatherMapUrl = "https://api.openweathermap.org/data/2.5/weather";
class WeatherModel {


  Future getLocationWeather() async {
    Location locationManager = Location();
    await locationManager.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherMapUrl?lat=${locationManager.latitude}&lon=${locationManager.longitude}&units=metric&appid=$apiKey");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


Future getCityWeather(var cityName) async {
  NetworkHelper networkHelper = NetworkHelper(
      "$openWeatherMapUrl?q=$cityName&units=metric&appid=$apiKey");
  var weatherData = await networkHelper.getData();
  return weatherData;

}


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
