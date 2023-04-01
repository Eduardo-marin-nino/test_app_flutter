import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {};
    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
