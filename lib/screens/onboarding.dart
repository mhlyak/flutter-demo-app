import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/onboarding_slide.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}): super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _introWidgetsList = <Widget>[
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
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      color: Color(0xff262627)
    ),
    child: Stack(      
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        // Slide screens
        PageView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: _introWidgetsList.length,
          controller: _pageController,
          onPageChanged: (int page) {
            getChangedPageAndMoveBar(page);
          },
          //controller: controller,
          itemBuilder: (context, index) {
            return _introWidgetsList[index];
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
                  for(int i = 0; i < _introWidgetsList.length; i++)
                    if(i == _currentPage) ...[circleBar(true)]
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
            style: ElevatedButton.styleFrom(              
              minimumSize: const Size.fromHeight(50.0),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              primary: const Color(0xfff7cf46),
              onPrimary: const Color(0xff404041),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
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

  Widget circleBar(bool isActive) => AnimatedContainer(
    duration: const Duration(microseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 10 : 6,
    width: isActive ? 10 : 6,
    decoration: BoxDecoration(
      color: isActive ? const Color(0xfff7cf46) : const Color(0xff364767)
    ),
  );

  void getChangedPageAndMoveBar(int page) {
    _currentPage = page;
    setState(() {});
  }

  bool isFinalPage() {
    return _currentPage == (_introWidgetsList.length - 1);
  }
}