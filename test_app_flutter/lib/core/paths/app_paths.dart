import 'package:flutter/material.dart';
import 'package:test_app_flutter/gui/views/login_view/login_view.dart';
import 'package:test_app_flutter/gui/views/register_view/register_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      '/': MaterialPageRoute(builder: (_) => const LoginView()),
      'register': MaterialPageRoute(builder: (_) => const RegisterView()),
    };
    return routesMap[settings.name!] ?? routesMap['/']!;
  }
}
