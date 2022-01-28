import 'package:flutter/material.dart';
import 'Loading_Screen.dart';

void main() {
  runApp(const MyApp());
}

//=> runApp(MaterialApp(
//   initialRoute: '/',
//   routes: {
// '/':(context) =>const LoadingScreen(),
// 'home':(context)=>  Home(airQualityModel:null)
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
