/*Order number ( number can be string or built from 2 ID’s like: OID ( RID ) where OID
is Merchant’s Order ID and RID is Coolomat internal ID )
Status : Ready to be picked up , Order picked up (but we still show button to open
the lockers and we call it ‘Re-open’ in this case)
Merchant name ( Note: only useful in the multi-merchant settings )
Datetime of the pickup window when the order has to be picked-up like 17.5.2022
10:00 - 12:00
Datetime of order - when order was created 16.5.2022 10:34
Lockers occupied by the order (lockers that will open) like A1, B4*/

enum OrderStatus {
  ready,
  done
}

class Order {
  
  String number;

  OrderStatus status;

  String? merchantName;

  DateTime dueDate;

  DateTime orderDate;

  List<String> lockers;

  Order(this.number, this.status, this.dueDate, this.orderDate, this.lockers);

}