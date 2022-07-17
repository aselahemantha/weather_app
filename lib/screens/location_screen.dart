import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';
import 'city_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'more_details.dart';


class LocationScreen extends StatefulWidget {

  LocationScreen(this.locationWeather);

  late final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}
class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late String weatherIcon;
  late int temperature;
  late String city;
  late String weatherMessage;
  late String description;
  late var moreWeather;

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
    moreWeather = widget.locationWeather;
  }

  void updateUI(dynamic weatherData){
    setState((){
      if (weatherData == null){
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather';
        city = '';
        description = '';
      }
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature);
      city = weatherData['name'];
      description = weatherData['weather'][0]['description'];

    },);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      decoration: kBoxDecoration,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '$temperature° $weatherIcon',
                              style: kTempTextStyle,
                            ),
                            Text(
                              '$description',
                              textAlign: TextAlign.center,
                              style: kMessageTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$weatherMessage in $city!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: kActiveBlockColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () async {
                        WeatherModel weatherModel = WeatherModel();
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                        moreWeather = weatherData;
                      },
                      child: const Icon(
                        FontAwesomeIcons.crosshairs,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kActiveBlockColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: const EdgeInsets.all(25.0),
                      child: TextButton(
                        onPressed: ()  {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return MoreDetails(moreWeather);
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'More Details',
                          style: kBottomText,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kActiveBlockColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.all(25.0),
                    child: TextButton(
                      onPressed: () async {
                        var typename = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return CityScreen();
                            },
                          ),
                        );
                        if (typename != null){
                          var weatherData = await weather.getCityWeather(typename);
                          updateUI(weatherData);
                          moreWeather = weatherData;
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
