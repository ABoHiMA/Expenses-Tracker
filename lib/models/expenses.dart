import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final frmt = DateFormat.yMEd();

enum Category { gamed, perfectooo, batal }

const categoryIcons = {
  Category.gamed: Icons.man,
  Category.perfectooo: Icons.wallet,
  Category.batal: Icons.woman,
};

class Expenses {
  Expenses({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get fdate {
    return frmt.format(date);
  }
}
