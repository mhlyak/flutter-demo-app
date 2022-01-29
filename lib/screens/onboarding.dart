import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/onboarding_slide.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}): super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int _index = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _slidesList = <Widget>[
    const OnboardingSlide(
      title: 'Odbieraj przseylki zdalnie!',
      description: 'Juz nie musisz wpisywac koduani skanowac go w Paczkomacie.',
      imagename: 'images/onboarding_a.png',
    ),
    const OnboardingSlide(
      title: 'Jak to dziala?',
      description: 'Zbliz sie do Paczkomatu i kliknij....',
      imagename: 'images/onboarding_b.png',
    ),
    const OnboardingSlide(
      title: 'Sledz swoja przeskylke',
      description: 'Aby na biezaco monitorowac wedrowke Twojej przsedylki kliknij opcje ....',
      imagename: 'images/onboarding_c.png',
    )
  ];
  
  @override
  Widget build(BuildContext context) {   

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff262627)
      ),
      child: Stack(      
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // Slide screens
          PageView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: _slidesList.length,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _index = index;
              });
            },
            //controller: controller,
            itemBuilder: (context, index) {
              return _slidesList[index];
            },
          ),

          // Number of slides and active slide indicator
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 320),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for(int i = 0; i < _slidesList.length; i++)
                      if(i == _index) ...[circleBar(true)]
                      else ...[circleBar(false)]
                  ],
                ),
              )
            ],
          ),

          // Slides button
          Container(
            margin: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                if(!isFinalPage()) {
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 1000), 
                    curve: Curves.bounceInOut
                  );
                }
                else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text(!isFinalPage() ? 'Dalej' : 'Gotowe')
            )
          )
        ]
      )
    );
  }

  Widget circleBar(bool isActive) => AnimatedContainer(
    duration: const Duration(microseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 10 : 6,
    width: isActive ? 10 : 6,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xfff7cf46) : const Color(0xff364767)
    ),
  );

  bool isFinalPage() {
    return _index == (_slidesList.length - 1);
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(microseconds: 1000), 
      curve: Curves.bounceInOut
    );
  }

  void navigateTo({String route = '/home'}) {
    Navigator.pushReplacementNamed(context, route);
  }
}