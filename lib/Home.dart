import 'package:flutter/material.dart';
import 'package:air_quality_app/air_quality_model.dart';
import 'package:air_quality_app/pollution.dart';
import 'package:flutter/services.dart';
import 'package:air_quality_app/Loading_Screen.dart';
class Home extends StatefulWidget {
  final AirQualityModel airQualityModel;
  const Home({Key? key, required this.airQualityModel}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PollutionModel pollutionModel = PollutionModel();

  late String precaution;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Find Your",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Air Quality Visuals",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(244, 243, 243, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          hintText: "Search your nearest location's ",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Current Location Data",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          // gradient: LinearGradient(
                          //     begin: Alignment.bottomRight,
                          //     stops:const [
                          //       0.3,
                          //       0.9
                          //     ],
                          //     colors: [
                          //       Colors.black.withOpacity(.8),
                          //       Colors.black.withOpacity(.2)
                          //     ])
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    precaution = pollutionModel.getPollution(
                                        widget.airQualityModel.data.aqi),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.masks_outlined,
                                    size: 40,
                                  ),
                                  Text(
                                    widget.airQualityModel.data.aqi.toString(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const Text(
                                    "US AQI",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'Location',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.location_city,
                                    size: 40,
                                  ),
                                  Text(
                                    widget.airQualityModel.data.city.name,
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    'Date - Time',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.timer,
                                    size: 40,
                                  ),
                                  Text(widget.airQualityModel.data.time.s)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  const Text(
                                    "Dominent Polutent Level",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.timeline_outlined,
                                    size: 40,
                                  ),
                                  Text(
                                    widget.airQualityModel.data.dominentpol,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

