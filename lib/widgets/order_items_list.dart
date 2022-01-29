import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/order.dart';
import 'package:flutter_application_1/widgets/order_list_item.dart';

class OrderItemsList extends StatelessWidget {

  late List<Order> pendingOrders;

  OrderItemsList({Key? key, required this.pendingOrders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff000000),
      ),
      child: ListView.builder(
        itemCount: pendingOrders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderListItem(
            order: pendingOrders[index]
          );
        },
      ),
    );
  }
}