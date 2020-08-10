import 'package:flutter/material.dart';
import 'package:world_time/home/ChooseLocation.dart';
import 'package:world_time/home/LoadingScreen.dart';
import 'utils/Constants.dart';
import 'home/Home.dart';

void main() => runApp(
      MaterialApp(
//        home: Home(), // this will conflict with base route
        initialRoute: BASE_ROUTE, // this will tell which route we start after base route
        routes: {
          BASE_ROUTE: (context) => LoadingScreen(),
          HOME_ROUTE: (context) => Home(),
          CHOOSE_LOCATION_ROUTE: (context) => ChooseLocation(),
        },
      ),
    );
