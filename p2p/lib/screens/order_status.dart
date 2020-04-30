import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  final String orderId;
  OrderStatus({this.orderId});
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  String orderId;
  @override
  void initState() {
    super.initState();
    orderId = widget.orderId;
  }

  // After Receiving the order ID the order details needs to be streamed
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}
