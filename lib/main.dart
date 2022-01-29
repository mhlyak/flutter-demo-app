import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/onboarding.dart';
import 'package:flutter_application_1/widgets/onboarding_slide.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      // In this sample app, CatalogModel never changes, so a simple Provider
      // is sufficient.
      Provider(create: (context) => CatalogModel()),
      // CartModel is implemented as a ChangeNotifier, which calls for the use
      // of ChangeNotifierProvider. Moreover, CartModel depends
      // on CatalogModel, so a ProxyProvider is needed.
      ChangeNotifierProxyProvider<CatalogModel, CartModel>(
        create: (context) => CartModel(),
        update: (context, catalog, cart) {
          if (cart == null) throw ArgumentError.notNull('cart');
          cart.catalog = catalog;
          return cart;
        },
      ),
    ],
    child: MaterialApp(
      title: 'Demo App',    
      initialRoute: '/intro',
      routes: {
        '/intro': (context) => OnboardingSlide(
          title: 'Witaj w apliakcji TRATA Mobile!',
          description: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
          buttonTitle: 'Rozpocznij',
          onClick: () => {
            Navigator.pushReplacementNamed(context, '/')
          },
          imagename: 'images/onboarding_intro.png',
        ),
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => HomeScreen()
      },
      theme: appTheme()
    ) 
  );
}

ThemeData appTheme() => ThemeData(
  // Default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: const Color(0xff262627),

  // Default font family.
  fontFamily: 'Georgia',

  // Default `TextTheme`.
  textTheme: const TextTheme(
    // headlines 1-6
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    // subtitles 1-2
    subtitle1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    // bodytexts 1-2
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    // caption
    // button
    // overline
  ),

  // Default `ElevatedButtonThemeData`.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50.0),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      primary: const Color(0xfff7cf46),
      onPrimary: const Color(0xff404041),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold
      )
    )
  )
);