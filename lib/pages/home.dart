import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String capital = data['capital'];

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/world.jpg'),
                fit:BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result!=null){
                      setState(() {
                        data={
                          'country':result['country'],
                          'capital':result['capital'],
                          'flag':result['flag']
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    "EDIT LOCATION",
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['country'],
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Capital : $capital",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey[200]
                  ),
                ),
                SizedBox(height: 20),
                Image(
                  image: NetworkImage(data['flag']),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
