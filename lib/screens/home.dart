import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/widgets/order_items_list.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sledzenie przesylek')
      ),
      body: OrderItemsList(pendingOrders: [
        Order('1', OrderStatus.ready, DateTime(2022, 4, 1, 5, 0, 0), DateTime(2022, 4, 1, 5, 0, 0), ['A1']),
        Order('2', OrderStatus.ready, DateTime(2022, 4, 1, 5, 0, 0), DateTime(2022, 4, 1, 5, 0, 0), ['A2']),
        Order('3', OrderStatus.done, DateTime(2022, 4, 1, 5, 0, 0), DateTime(2022, 4, 1, 5, 0, 0), ['A1']),
        Order('4', OrderStatus.ready, DateTime(2022, 4, 1, 5, 0, 0), DateTime(2022, 4, 1, 5, 0, 0), ['A4']),
        Order('5', OrderStatus.ready, DateTime(2022, 4, 1, 5, 0, 0), DateTime(2022, 4, 1, 5, 0, 0), ['B3'])
      ],),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff262627)
              ),
              child: Text('LOGO')
            ),
            ListTile(
              title: Text('Archiwum'),
            ),
            ListTile(
              title: Text('Mapa'),
            ),
            ListTile(
              title: Text('Pomoc'),
            ),
            ListTile(
              title: Text('O aplikaciji'),
            )
          ],
        ),
      ),      
    );
  }
}