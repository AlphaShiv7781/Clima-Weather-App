import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/city_screen.dart';
class LocationScreen extends StatefulWidget {
    LocationScreen( {required this.locationWeather});
  late final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
   WeatherModel weather = WeatherModel();
   late int temperature;
   late String tempMessage;
  late  String weathericon;
  late String cityName;

  @override
  void initState() {
    super.initState();

    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {

    setState((){

      if(weatherData == null)
        {
          temperature = 0;
          weathericon = 'Error';
          tempMessage = 'Unable to get weather data';
          cityName = '';
          return;
        }
      temperature = (weatherData['main']['temp']).round() ;
      tempMessage = weather.getMessage(temperature);
      var condition =weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weathericon=weather.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: const Color(0xFF15FFFC),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/img4.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                 Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.indigo,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                     var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context)=> CityScreen() ));
                      if(typedName!=null){
                        var weatherData2 = await weather.getWeatherByCityName(typedName);
                         updateUi(weatherData2);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.green ,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children:  <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                     Text(
                      '$weathericon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$tempMessage in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
