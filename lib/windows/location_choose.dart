import 'package:flutter/material.dart';
import 'package:world_time_app/service/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

  List<WorldTime>  locations =[
    WorldTime(location:'Cario',url:'Africa/Cairo'),
    WorldTime(location: 'Chicago' ,url :'America/Chicago'),
    WorldTime(location: 'New York' ,url : 'America/New_York'),
    WorldTime(location:'Phoenix' ,url :'America/Phoenix'),
    WorldTime(location: 'Kabul',url :'Asia/Kabul'),
    WorldTime(location: 'Dubai' ,url :'Asia/Dubai'  ),
    WorldTime(location:'Tokyo' ,url:'Asia/Tokyo'),
    WorldTime(location: 'Oral',url :'Asia/Oral'),
    WorldTime(location:'Singapore',url :'Asia/Singapore'),
    WorldTime(location:'Rome',url:'Europe/Rome'),
  ];





class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor:Colors.green[800],
        title:Text('Choose A Place',
        style:TextStyle(
          fontSize:20.0,
          fontWeight:FontWeight.bold,
          color:Colors.black87
        ),),
        centerTitle: true ,
      ),
        body:  ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index) {
            return Card(
              child:ListTile(
                onTap: () async {
                  WorldTime ins =locations[index];
                  await ins.getData();
                  Navigator.pop(context,{
                    'time' : ins.time ,
                    'location':ins.location,
                    'isDay' : ins.isDay
                  });
                  },
                leading: Icon(Icons.my_location,
                color:Colors.green[300],),
                title:Text(locations[index].location,
                style:TextStyle(
                  fontSize:15.0,
                  color:Colors.green[600],
                ),
                ),
              ),
            );
          },


        ),

    );
  }
}
