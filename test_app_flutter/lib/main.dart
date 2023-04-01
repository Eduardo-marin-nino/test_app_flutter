import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/paths/app_paths.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/index_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.storeProviders,
      child: MaterialApp(
        initialRoute: "/",
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
