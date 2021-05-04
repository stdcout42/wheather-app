import 'dart:convert';
import 'package:clima/utilities/appid.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Error status code: ${response.statusCode}");
    }
  }
}
