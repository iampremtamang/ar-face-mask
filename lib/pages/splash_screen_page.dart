import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
   return SplashScreen(
     seconds: 10,
     title: Text(
       'AR  Face  Masks  App',
       style: TextStyle(
         fontSize: 45,
         color: Colors.purpleAccent,
         fontFamily: "Signatra",
       ),
     ),
     image: Image.asset('assets/images/icon.png'),
     backgroundColor: Colors.white,
     photoSize: 140,
     loaderColor: Colors.deepPurple,
     loadingText: Text(
       'by Prem Tamnag',
       style: TextStyle(
         color: Colors.deepPurpleAccent,
         fontSize:16,
         fontFamily: "Brand Bold"
       ),
     ),
   );
  }
}
