import 'package:flutter/material.dart';

class HomeAction {
  final String title;
  final String routeName;
  final Color color;
  final IconData icon;
  final bool vertical;
  final bool requiresPro;

  const HomeAction({
    required this.title,
    required this.routeName,
    required this.color,
    required this.icon,
    this.vertical = false,
    this.requiresPro = false,
  });
}
