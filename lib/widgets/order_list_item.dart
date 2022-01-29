import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/order.dart';

class OrderListItem extends StatelessWidget {

  late Order order;

  OrderListItem({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff262627)
      ),
      margin: EdgeInsets.only(top: 10.0),
      child: Text(order.number),
    );
  }
}