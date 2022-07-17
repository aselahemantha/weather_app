import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  @override
  void deactivate(){
    super.deactivate();
  }

  void getLocationData() async{
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context){
            return LocationScreen(weatherData);
          }
      ),
    );
  }

  void getData() async {
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/loading_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.blue,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
