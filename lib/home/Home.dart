import 'package:flutter/material.dart';
import 'package:world_time/utils/Constants.dart';

/// Stateful Widget lifecycle
/// initState()
/// Build()
/// Dispose()

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  final String argsLocation = "LOCATION";
  final String argsFlag = "FLAG";
  final String argsTime = "TIME";
  final String argsIsDayTime = "IS_DAY_TIME";

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String backgroundImage = data[argsIsDayTime] ? "day.png" : "night.png";
    Color appBarColor = data[argsIsDayTime] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
//      backgroundColor: appBarColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$backgroundImage'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, CHOOSE_LOCATION_ROUTE);
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data[argsLocation],
                      style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data[argsTime],
                  style: TextStyle(fontSize: 66.0, color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
