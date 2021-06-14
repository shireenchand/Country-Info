import 'package:flutter/material.dart';
import 'package:world/services/data.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  void sendData(Data instance) async{

    await instance.getData();
    Navigator.pop(context,{
      'country':instance.country,
      'capital':instance.capital,
      'flag':instance.flag
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: TextField(
            onSubmitted: (String value) async {
              Data instance = Data(country: value);
              sendData(instance);
            },
            cursorColor: Colors.redAccent,
            cursorHeight: 50,
            cursorWidth: 10,
            decoration: InputDecoration(
              border: OutlineInputBorder()
            ),
          ),
        ),
      ),
    );
  }
}
