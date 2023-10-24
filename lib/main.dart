import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const CHANNEL = 'it.pixeldump.pocs.flutterpdwrapdemo';
  static const platformChannel = const MethodChannel(CHANNEL);

  bool _playStatus = false;

  void _toggleAudio(bool newValue){

    var methodName = newValue ? 'startTone' : 'stopTone';

    platformChannel.invokeMethod(methodName);

    setState((){
      _playStatus = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    print('app started');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Flutter, pd-for-android wrap demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('sound: $_playStatus'),
              new Switch(
                value: _playStatus,
                onChanged: _toggleAudio,
              ),
            ],
          ),
        ),
      ),
    );
  }
}