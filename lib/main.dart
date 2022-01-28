import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/onboarding.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/home': (context) => HomeScreen()
      }
    ) 
  );
}