import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{

  String location;//location name for UI
  String time ;//time at location
  String url;// location Url
  String flag; //url to an asset flag icon
  bool isDay;

  WorldTime({this.location,this.url});


  Future<void> getData() async {

    try {
      // making Request for information
        Response response = await get('http://worldtimeapi.org/api/timezone/$url');
        Map data = jsonDecode(response.body);

        //Receiving Required data from the info
        String dateTime = data['datetime'];
        String offset = data['utc_offset'].substring(1,3);
        String off = data['utc_offset'].substring(4,6);

        //Creating DateTime object
        DateTime  now = DateTime.parse(dateTime);
        now =  now.add(Duration(hours: int.parse(offset),minutes: int.parse(off)));

        isDay = now.hour > 6 && now.hour < 18 ? true:false;

        time = DateFormat.jm().format(now);
  }

    catch(e){
      print('Error is : $e');
      time = 'Cannot Access The Data';
    }
  }




}