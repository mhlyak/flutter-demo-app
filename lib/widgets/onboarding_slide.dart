import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide(
      {Key? key,
      this.title = '',
      this.description = '',
      this.buttonTitle = '',
      this.onClick,
      this.imagename = 'images/onboarding_default.png'})
      : super(key: key);

  final String title;

  final String description;

  final String buttonTitle;

  final VoidCallback? onClick;

  final String imagename;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff262627)
      ),
      child: Column(
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
                    style: Theme.of(context).textTheme.bodyText1,
                    //style: const TextStyle(fontSize: 15.0, color: Color(0xfff2f2f2)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2,
                    //style: const TextStyle(fontSize: 12.0, color: Color(0xfff2f2f2)),
                  ),
                )
              ],
            )
          ),
          Container(
            margin: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              /*style: ElevatedButton.styleFrom(              
                minimumSize: const Size.fromHeight(50.0),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                primary: const Color(0xfff7cf46),
                onPrimary: const Color(0xff404041),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),*/
              onPressed: onClick,
              child: Text(buttonTitle)
            )
          )
        ],
      )
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
