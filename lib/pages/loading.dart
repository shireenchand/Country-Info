import 'package:flutter/material.dart';
import 'package:world/services/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getResults() async {
    Data instance = Data(country: "Japan");
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'country':instance.country,
      'capital':instance.capital,
      'flag':instance.flag
    });
  }

  @override
  void initState() {
    super.initState();
    getResults();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
      )
    );
  }
}
