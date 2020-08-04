import 'package:flutter/material.dart';
import 'package:world_time_app/windows/home.dart';
import 'package:world_time_app/windows/loading.dart';
import 'package:world_time_app/windows/location_choose.dart';

void main() =>runApp(MaterialApp(
  initialRoute : '/',
  routes: {
    '/': (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' :(context) => Location(),
  }
));
