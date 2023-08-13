import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
class WeatherModel {

  Future<dynamic>getWeatherByCityName(String cityName)async{
     var url = 'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=87a12d862f044f4ec75dd9c9689f6042&units=metric';
     NetworkHelper networkHelper = NetworkHelper(url: Uri.parse(url));
     var weatherData = await networkHelper.getData();
     return weatherData;
  }
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.longitude);
    print(location.latitude);
    String url ='https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=87a12d862f044f4ec75dd9c9689f6042&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: Uri.parse(url));
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
