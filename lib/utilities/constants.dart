import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
  fontSize: 100.0,
  color: Colors.white
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontWeight: FontWeight.bold,
  fontSize: 40.0,
  color: Colors.white
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextInputFieldsDecorations =  InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.blueGrey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
    borderSide: BorderSide.none,
  ),
);