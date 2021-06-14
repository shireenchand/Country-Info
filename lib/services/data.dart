import 'dart:convert';

import 'package:http/http.dart';

class Data{

  String capital="";
  String flag="";
  String code="";
  String country="";

  Data({required this.country});

  Future<void> getData() async {

    try{
      Response response = await get(Uri.parse("https://restcountries.eu/rest/v2/name/$country?fullText=true"));
      dynamic data = jsonDecode(response.body);


      capital = data[0]['capital'];
      code = data[0]['alpha2Code'];

      flag = "https://www.countryflags.io/$code/shiny/64.png";


    }
    catch(e){
      // country = "couldn't find country";
      // capital = "couldn't find capital";
      // flag = "couldn't find flag";
      print("caught error - $e");
    }

  }

}