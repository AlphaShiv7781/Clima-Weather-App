import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: const Color(0xFF15FFFC),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/img1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                     Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child:  TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: kTextInputFieldsDecorations,

                    onChanged: (text) {
                       cityName = text;
                    },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context,cityName);
                  },
                  child: const Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}