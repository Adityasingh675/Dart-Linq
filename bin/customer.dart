class Customer {
  int id;
  String customerName;
  int age;
  String area;
  List<Order> Orders;

  Customer({this.Orders, this.age, this.area, this.customerName, this.id});

  @override
  String toString() {
    // TODO: implement toString
    return 'Customer{id: $id, customerName: $customerName, age: $age, area: $area, orders: $Orders}';
  }
}

class Order {
  int orderID;
  double orderTotal;
  DateTime orderDate;

  Order({this.orderDate, this.orderID, this.orderTotal});

  @override
  String toString() {
    return 'Order{orderID: $orderID, orderTotal: $orderTotal, orderDate: $orderDate}';
  }
}

var customers = <Customer>[
  Customer(id: 1, customerName: 'Aditya', age: 16, area: 'Cuttack', Orders: [
    Order(
      orderID: 16,
      orderDate: DateTime.now(),
      orderTotal: 2919,
    ),
    Order(
      orderID: 40,
      orderDate: DateTime.now(),
      orderTotal: 6742,
    ),
    Order(
      orderID: 10,
      orderDate: DateTime(2016, 22, 2, 10, 38, 19),
      orderTotal: 1002,
    ),
  ]),
  Customer(
      id: 2,
      customerName: 'Avishek',
      age: 22,
      area: 'Bhubaneswar',
      Orders: [
        Order(
          orderID: 60,
          orderDate: DateTime.now(),
          orderTotal: 1319,
        ),
        Order(
          orderID: 49,
          orderDate: DateTime(2012, 12, 9),
          orderTotal: 1232,
        ),
        Order(
          orderID: 18,
          orderDate: DateTime(2019, 25, 4),
          orderTotal: 1035,
        ),
      ]),
  Customer(id: 3, customerName: 'Binju', age: 22, area: 'Rahama', Orders: [
    Order(
      orderID: 127,
      orderDate: DateTime(2010, 18, 7),
      orderTotal: 1546,
    ),
    Order(
      orderID: 1342,
      orderDate: DateTime(2020, 10, 1),
      orderTotal: 1382,
    ),
    Order(
      orderID: 39,
      orderDate: DateTime(2019, 3, 2),
      orderTotal: 328,
    ),
  ])
];
