import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:zero_lite/pages/homepage.dart';
import 'package:zero_lite/widget/makeText.dart';

class IntroPageView extends StatefulWidget {
  @override
  _IntroPageViewState createState() => _IntroPageViewState();
}

class _IntroPageViewState extends State<IntroPageView> {
  final pages = [
    PageViewModel(
      pageColor: Colors.amberAccent.shade100,
      bubble: Icon(Icons.place_rounded),
      mainImage: SvgPicture.asset(
        'assets/world.svg',
      ),
      body: makeText("God made the country, and man made the town"),
      title: makeText("Zero Lite"),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ),
    PageViewModel(
      pageColor: Colors.blueGrey.shade100,
      bubble: Icon(Icons.security_rounded),
      mainImage: SvgPicture.asset(
        'assets/shield.svg',
      ),
      body: makeText(
          "Uncertainty and expectation are the joys of life. Security is an insipid thing"),
      title: makeText("Zero Lite"),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ),
    PageViewModel(
      pageColor: Colors.pink.shade100,
      bubble: Icon(
        Icons.location_city_rounded,
      ),
      mainImage: SvgPicture.asset(
        'assets/cityscape.svg',
      ),
      body: makeText("The city is not a concrete jungle, it is a human zoo"),
      title: makeText("Zero Lite"),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        pages,
        skipText: makeText(
          "SKIP",
          color: Colors.black,
          size: 15,
        ),
        backText: makeText(
          "BACK",
          color: Colors.black,
          size: 15,
        ),
        nextText: makeText(
          "NEXT",
          color: Colors.black,
          size: 15,
        ),
        doneText: makeText(
          "DONE",
          color: Colors.black,
          size: 15,
        ),
        showNextButton: true,
        showBackButton: true,
        showSkipButton: true,
        onTapSkipButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(title: 'Zero Lite'),
            ),
          );
        },
        onTapDoneButton: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(title: 'Zero Lite'),
            ), //MaterialPageRoute
          );
        },
        pageButtonTextStyles: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
