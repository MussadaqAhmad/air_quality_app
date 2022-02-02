import 'package:air_quality_app/Home.dart';
import 'package:flutter/material.dart';
import 'Loading_Screen.dart';
import 'package:air_quality_app/Data.dart';
void main() 
{
  runApp(const MyApp());
}

// => runApp(MaterialApp(
//   initialRoute: '/',
//   routes: {
// '/':(context) =>const LoadingScreen(),
// 'home':(context)=>  Home(airQualityModel: )
//   },
// ));
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
