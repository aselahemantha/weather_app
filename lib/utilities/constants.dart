import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 100.0,
);

const kMoreTempHead = TextStyle(
  fontFamily: 'Edu',
  fontSize: 20.0,
);

const kMoreTempNumberStyle = TextStyle(
  fontFamily: 'MPL',
  fontSize: 40.0,
);

const kMoreTempText = TextStyle(
  fontFamily: 'MPL',
  fontSize: 20.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Lato',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Lato',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kInputDecorationTextFeild = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0),),
  ),
);

var kBoxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black12.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(25.0),
);

var kBoxDecorationHead = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(25.0),
);

const kBottomHeight = 60.0;
const kActiveBlockColor = Color(0xFF1D1E33);
const kInactiveBlockColor = Color(0xFF111328);
const kBottomColor = Color(0xFFEB1555);

const kBottomText = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Lato',
  fontWeight: FontWeight.bold,
  color: Colors.white,
);