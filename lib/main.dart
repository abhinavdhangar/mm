
import "package:flutter/material.dart";
import "package:workmanager/workmanager.dart";
import 'package:audioplayers/audioplayers.dart';

const myTask = "increaseCount";
final audioPlayer = AudioPlayer();
int count = 0;
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case myTask:
        Source uri =
            UrlSource("https://media.graphassets.com/RpXalWHISuyetFYPW9kE");
        audioPlayer.play(uri);
        count++;
        break;
    }
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher,isInDebugMode: true);
  Workmanager()
      .registerPeriodicTask("test", myTask, frequency: Duration(minutes: 15));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column
      (children: [
        Text("hello $count"),
        
      ]),
    );
  }
}