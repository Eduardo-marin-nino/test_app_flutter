import 'package:flutter/material.dart';

useNavigatePushName(BuildContext context, String route, {Object? arguments}) {
  Navigator.of(context).pushNamed(route, arguments: arguments);
}

void useNavigatePop(BuildContext context) async {
  Navigator.of(context).pop();
}

useNavigateReplaceName(BuildContext context, String route,
    {Object? arguments}) {
  Navigator.of(context).pushReplacementNamed(
    route,
    arguments: arguments,
  );
}

useNavigateReplacePage(BuildContext context, String route) {
  Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
}
