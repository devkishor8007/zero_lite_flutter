import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zero_lite/pages/introPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Lite',
      debugShowCheckedModeBanner: false,
      home: IntroPageView(),
    );
  }
}
