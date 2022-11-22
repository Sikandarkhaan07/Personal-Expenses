import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {
        @required this.id = '',
        @required this.title = '',
        @required this.amount=0.0,
        required this.date
      }
      );
      //: this.date = date ?? DateTime.now();
}
