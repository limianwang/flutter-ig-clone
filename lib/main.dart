import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontFamily: "Aveny",
          ),
        ),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1.0,
        leading: Icon(FontAwesomeIcons.camera),
        title: SizedBox(
          height: 35.0,
          child: Image.asset('images/instagram.png'),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(FontAwesomeIcons.paperPlane),
          )
        ],
      ),
      body: AppBody(),
      bottomNavigationBar: AppNavigation(),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppBodyState();
  }
}

class AppBodyState extends State<AppBody> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');

  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        RaisedButton(
          child: Text('Get Battery Level'),
          onPressed: _getBatteryLevel,
        ),
        Text(_batteryLevel),
        Flexible(
          child: AppBodyList(),
        )
      ],
    );
  }
}

class AppBodyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var deviceSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/me.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'limian.wang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Image.asset(
              'images/corgi.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(FontAwesomeIcons.heart),
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(FontAwesomeIcons.comment),
                    SizedBox(
                      width: 16.0,
                    ),
                    Icon(FontAwesomeIcons.paperPlane),
                  ],
                ),
                Icon(FontAwesomeIcons.bookmark),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Text(
              'Liked by limian.wang and 522,000 others',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 65.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.add_box,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.account_box,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
