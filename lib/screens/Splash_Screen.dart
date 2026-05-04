import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/screens/Login_Screen.dart';

import '../utils/asset_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState(); 
    movetoNextScreen();
  }


  Future<void>movetoNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
  children: <Widget>[
    SvgPicture.asset(AssetPaths.backgroundSVG,),
    Center(child: SvgPicture.asset(AssetPaths.logoSVG)),
  ],
),

    );
  }
}
