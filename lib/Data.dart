import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:air_quality_app/air_quality_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:air_quality_app/Home.dart';

class Data_1 {
  var b;
   getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
     await getData(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData(var lat, var lon) async {
    var url = Uri.parse(
        "https://api.waqi.info/feed/geo:$lat;$lon/?token=b172fba8ca1b9c8f9946c0cdbb03c3621d3586ee");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      // var aqi_level = convert.jsonDecode(data)['data']['aqi'];
      // var cityName = convert.jsonDecode(data)['data']['city']['name'];
      //  var time = convert.jsonDecode(data)['data']['time'];
      final parsedJson = convert.jsonDecode(data);
      final airquality = AirQualityModel.fromJson(parsedJson);
      b = airquality;

      print(b);
      print('object');
      
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => Home(airQualityModel: airquality)),
      //     (route) => false);
    } else {
      print(response.statusCode);
    }
  }
}
