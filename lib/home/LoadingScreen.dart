import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/models/WorldTime.dart';
import 'package:world_time/utils/Constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }

  setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Singapore', flag: 'my.png', url: 'Asia/Singapore');
    await instance.getTime();
    routeToHome(instance.location, instance.flag, instance.time, instance.isDayTime);
  }

  void routeToHome(String location, String flag, String time, bool isDayTime) {
    final String argsLocation = "LOCATION";
    final String argsFlag = "FLAG";
    final String argsTime = "TIME";
    final String argsIsDayTime = "IS_DAY_TIME";

    // will pop the Loading screen
    Navigator.pushReplacementNamed(
      context,
      HOME_ROUTE,
      arguments: {argsLocation: location, argsFlag: flag, argsTime: time, argsIsDayTime: isDayTime},
    );
  }
}
