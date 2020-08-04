import 'package:flutter/material.dart';
import 'package:world_time_app/service/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}



class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ?  data : ModalRoute.of(context).settings.arguments ;
    print(data);

    String bg = data['isDay'] ? 'day1.jpg': 'night3.jpg' ;

    return Scaffold(
      appBar:AppBar(
        title:Text('Home'),
        centerTitle: true,
        backgroundColor:Colors.deepPurple,
      ),
      body:SafeArea(
        child:Container(
          decoration:BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Assets/$bg'),
              fit:BoxFit.cover,
            ),
          ) ,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,125.0,0,0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children:[
                RaisedButton.icon(
                  onPressed:() async {
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    print(result);
                    setState(() {
                      data = {
                        'time' :result['time'],
                        'isDay' : result['isDay'],
                        'location' :result['location']
                      };
                    });
                  },
                  icon:Icon(Icons.add_location,),
                  label:Text('Edit Location'),
                  color: Colors.amberAccent[400],
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(data['location'],
                    style:TextStyle(
                      fontSize: 30.0,
                     fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
                ),
                SizedBox(height:30.0),
                Text(data['time'],
                style:TextStyle(
                  fontSize: 50.0,
                  color:Colors.deepPurple,
                ),)
              ],

            ),
          ),
        ),
      ),
    );
  }
}
