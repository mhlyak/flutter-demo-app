import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide(
      {Key? key,
      this.title = '',
      this.description = '',
      this.imagename = 'images/onboarding_default.png'})
      : super(key: key);

  final String title;

  final String description;

  final String imagename;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imagename),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 25.0, left: 25.0, right: 25.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15.0, color: Color(0xfff2f2f2)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 75.0, left: 25.0, right: 25.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12.0, color: Color(0xfff2f2f2)),
                ),
              )
            ],
          )
        )
      ],
    );
  }

  Widget redContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red
      )
    );
  }

  Widget expandedRedContainer() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red
        )
      )
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(imagename),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffaaaaaa)
              ),
              child: const Text("TEST")
            ),
            Stack(

            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff555555)
                    ),
                    child: const Text("TEST2"),
                  )
                ],
              )
            )
            /*IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 15.0, color: Color(0xfff2f2f2)),
                    ),
                    margin: const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 50),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 12.0, color: Color(0xfff2f2f2)),
                  )
                ],
              )
            )*/
          ]
        )
      )
    );
  }*/
}
