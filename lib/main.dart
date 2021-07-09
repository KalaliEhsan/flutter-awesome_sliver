import 'package:awesome_sliver/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/routes_name.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Sliver',
      routes: {
        RoutesName.home: (context) => prepareScreen(Home()),
      },
    );
  }
  Widget prepareScreen(Widget screen,
      {TextDirection textDirection = TextDirection.rtl}) =>
      Directionality(textDirection: textDirection, child: screen);
}