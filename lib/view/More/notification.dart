import 'package:flutter/material.dart';

class NotificationV extends StatefulWidget {
  const NotificationV({super.key});

  @override
  State<NotificationV> createState() => _PaymentState();
}

class _PaymentState extends State<NotificationV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          
        ),
      ),
    );
  }
}