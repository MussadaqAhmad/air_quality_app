import 'package:air_quality_app/Home.dart';
import 'package:air_quality_app/air_quality_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:air_quality_app/Data.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Data_1 ani = Data_1();

  @override
  void initState() {
    super.initState();
    data_2();
  }

  void data_2() async {
    await ani.getLocation();
    
    if (ani.b != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home(airQualityModel: ani.b)),
          (route) => false);
    }
  }

  // void getLocation() async {
  //   try {
  //     LocationPermission permission = await Geolocator.requestPermission();
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     getData(position.latitude, position.longitude);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> getData(var lat, var lon) async {
  //   var url = Uri.parse(
  //       "https://api.waqi.info/feed/geo:$lat;$lon/?token=b172fba8ca1b9c8f9946c0cdbb03c3621d3586ee");
  //   http.Response response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     // var aqi_level = convert.jsonDecode(data)['data']['aqi'];
  //     // var cityName = convert.jsonDecode(data)['data']['city']['name'];
  //     //  var time = convert.jsonDecode(data)['data']['time'];
  //     final parsedJson = convert.jsonDecode(data);
  //     final airquality = AirQualityModel.fromJson(parsedJson);
  //     print(airquality);
  //     print('object');
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => Home(airQualityModel: airquality)),
  //         (route) => false);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitChasingDots(
        color: Colors.black,
        size: 50,
      )),
    );
  }
}
