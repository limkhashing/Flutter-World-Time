import 'package:flutter/material.dart';
import 'package:world_time/models/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'gb.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'sg.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'my.png'),
  ];

  @override
  void initState() {
    super.initState();
//    getData();
    // this line will still run because it outside of async scope
    print("Init State");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: Container(
                      width: 55.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                          image: AssetImage(
                            'icons/flags/png/${locations[index].flag}',
                            package: 'country_icons',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(50.0)),
                        border: new Border.all(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("Dispose");
  }

//  Future function is async code. To make it sync,
//  add async in the function header and await in the calling Future
  getData() async {
    // this is sync
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "Hello";
    });

    // this is async
//    Future.delayed(Duration(seconds: 3), () {
//      print("Simulate network call");
//    });

    print(username);
  }

  void updateTime(index) async {
    WorldTime chosenWorldTime = locations[index];
    await chosenWorldTime.getTime();
    routeToHome(chosenWorldTime.location, chosenWorldTime.flag,
        chosenWorldTime.time, chosenWorldTime.isDayTime);
  }

  void routeToHome(String location, String flag, String time, bool isDayTime) {
    final String argsLocation = "LOCATION";
    final String argsFlag = "FLAG";
    final String argsTime = "TIME";
    final String argsIsDayTime = "IS_DAY_TIME";

    Navigator.pop(
      context, {
        argsLocation: location,
        argsFlag: flag,
        argsTime: time,
        argsIsDayTime: isDayTime
      },
    ); // will pop the Loading screen
  }
}
