import 'package:flutter/material.dart';
import 'package:world_time_app/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time ='Loading ...';

  void setupTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata'  , url: 'Asia/Kolkata');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instance.location,
      'time':instance.time,
      'isDay' :instance.isDay
    }
    );
  }

  @override
  void initState(){
    super.initState();
    setupTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:Center(
        child:SpinKitPouringHourglass(
          color:Colors.white,
        ),
      )
    );
  }
}
