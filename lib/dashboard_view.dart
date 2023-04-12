import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workshopt/entry_form.dart';
import 'package:flutter_workshopt/model/pet_model.dart';
import 'package:flutter_workshopt/model/weather_current_model.dart';
import 'package:flutter_workshopt/notification_view.dart';
import 'package:flutter_workshopt/profile_view.dart';
import 'package:flutter_workshopt/storage/app_store_sqflite.dart';
import 'package:flutter_workshopt/storage/pet_view.dart';
import 'package:flutter_workshopt/weather_view.dart';
import 'package:http/http.dart';

/// Created by Anil Sharma on 14/02/23.
class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  WeatherCurrentModel? weatherModel;
  int _index = 0;

  List<Widget> container = [
    PetView(),
    WeatherView(),
    NotificationView(),
    ProfileView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: container[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home", backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on), label: "Weather", backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: "notification",
              backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile", backgroundColor: Colors.blueGrey),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.blueGrey[800],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => EntryView()));
// Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>EntryView()),(route)=>false);
      },
        child: Icon(Icons.add),),
    );
  }

  fetchData() async {
    if ((await Connectivity().checkConnectivity()) == ConnectivityResult.none) {
      final weatherData = await AppStoreSqflite.getWeather();
      print("weather Local db: ${weatherData[0]}");
      return;
    }
    final response = await get(Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=7967eda557694820b7e112640230501&q=India&aqi=no"));
    final json = const JsonDecoder().convert(response.body) as Map<String, dynamic>;
    setState(() {
      weatherModel = WeatherCurrentModel.fromJson(json);
      AppStoreSqflite.deleteWeather();
      AppStoreSqflite.insertWeather("New Delhi");
    });
  }


  Widget weatherUI() {
    return weatherModel != null
        ? Column(
      children: [
        ListTile(
          title: Text("${weatherModel!.location!.name}"),
        )
      ],
    )
        : SizedBox();
  }
}
