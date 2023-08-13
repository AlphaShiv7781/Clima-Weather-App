import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
   getLocationData();
    super.initState();
  }

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LocationScreen(locationWeather: weatherData,)),
    );
  }


  @override
  Widget build(BuildContext context) {

    return   Scaffold(

      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/img2.jpeg"), fit: BoxFit.cover),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const <Widget> [
             Center(
              // child: SpinKitDoubleBounce(
              //   color: Colors.grey,
              //   size: 100.0,
              // ),
               child: SpinKitPulse(
                 color: Colors.blueGrey,
                 size: 100.0,
               ),
            ),
            SizedBox(
               height: 15.0,
             ),
            Text(
               'Gathering Information please wait ...',
               style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                     color: Colors.blueGrey
                  ),
               ),
           ],
        ),
      ),
    );
  }
}