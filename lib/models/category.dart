import 'package:flutter/material.dart';

class Categorymodel {
  const Categorymodel({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  final String id;
  final String title;
  final Color color;
}
