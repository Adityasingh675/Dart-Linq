// LINQ - LANGUAGE INTEGRATED QUERY.

// import 'package:dart_linq/dart_linq.dart' as dart_linq;
import 'customer.dart';

void main() {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // for (var x in numbers) {
  //   if (x > 8) {
  //     print(x);
  //   }
  // }

  // Restriction operator

  // Using where operator (this is a type of restriction operator.)
  var results = numbers.where((number) => number > 5);
  results.forEach(print);

  var custa = customers.where((c) => c.age > 20 && c.id < 3);
  custa.forEach(print);

  // Projection operator(Select)

  var projResults = customers
      .where((c) => (c.age < 20 && c.area == 'Cuttack'))
      .map((c) => {"name": c.customerName, "age": c.age});

  projResults.forEach(
      (c) => print("My name is ${c['name']}, and my age is ${c['age']}"));

  // Projection operator(Select many - Compound)
  var projResults2 = customers.where((c) => c.id > 1).expand((c) =>
      c.Orders.where((o) => o.orderTotal > 1200).map((o) => o.orderTotal));
  projResults2.forEach(print);

  var projResults3 =
      customers.where((c) => c.id > 1).expand((c) => c.Orders.map((o) =>
          // ignore: prefer_single_quotes
          {"Name: ${c.customerName}, Order Total: ${o.orderTotal}"}));
  projResults3.forEach(print);

  var projResults4 = customers
      .where((c) => c.id > 1)
      .expand((c) => c.Orders)
      .where((o) => o.orderDate.isBefore(DateTime(2017)));
  projResults4.forEach(print);

  var projResults5 = customers
      .expand((c) => c.Orders)
      .map((o) => o.orderDate)
      .where((o) => o.isBefore(DateTime(2017)));
  projResults5.forEach(print);

  var projResults6 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal < 1700).map((o) =>
          {'name': c.customerName, 'total': o.orderTotal, 'date': o.orderDate}))
      .take(3);
  projResults6.forEach(print);

  var projResults7 = customers
      .expand((c) => c.Orders.where((o) => o.orderTotal < 1700).map((o) =>
          {'name': c.customerName, 'total': o.orderTotal, 'date': o.orderDate}))
      .skip(2);
  projResults7.forEach(print);

  // Partitioning operators

  var projResults8 = customers
      .expand((c) =>
          c.Orders.where((o) => o.orderTotal < 1700).map((o) => o.orderTotal))
      .takeWhile((t) => t > 1000);
  projResults8.forEach(print);

  // Set operator
  var numbers2 = [1, 2, 2, 3, 3, 3];
  var numbers3 = [1, 2, 3, 5, 6, 7, 8, 9];

  var results2 = numbers2.toSet().intersection(numbers3.toSet());
  results2.forEach(print);

  // Element operator
  var projResults9 = customers
      .expand((c) =>
          c.Orders.where((o) => o.orderTotal < 1700).map((o) => o.orderTotal))
      .elementAt(4);
  print(projResults9);

  var projResults10 = customers
      .expand((c) =>
          c.Orders.where((o) => o.orderTotal < 1700).map((o) => o.orderTotal))
      .first;
  print(projResults10);
}
