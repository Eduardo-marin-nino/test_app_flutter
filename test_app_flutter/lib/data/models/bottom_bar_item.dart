import 'package:flutter/material.dart';

class BottomBarItem {
  const BottomBarItem({
    required this.icon,
    required this.name,
    required this.widget,
    this.badge = false,
    this.validateAcess = false,
  });

  final String name;
  final Widget widget;
  final IconData icon;
  final bool? badge;
  final bool? validateAcess;

  BottomBarItem copyWith({
    Widget? widget,
    String? label,
    IconData? icon,
    bool? badge,
    bool? validateAcess,
  }) {
    return BottomBarItem(
      name: label ?? name,
      icon: icon ?? this.icon,
      widget: widget ?? this.widget,
      badge: badge ?? this.badge,
      validateAcess: validateAcess ?? this.validateAcess,
    );
  }
}
