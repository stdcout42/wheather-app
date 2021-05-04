import 'dart:convert';

import 'package:clima/utilities/appid.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                getLocation();
              },
              child: Text("Refresh"))
        ],
      ),
    );
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    getData(latitude: location.latitude, longitude: location.longitude);
  }

  void getData({double longitude, double latitude}) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appID'));
    var decodedData = jsonDecode(response.body);
    double temp = decodedData['main']['temp'];
    int condition = decodedData['weather'][0]['id'];
    String cityName = decodedData['name'];

    print('Condition: $cityName');
  }
}
