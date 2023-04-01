import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_flutter/core/config/dotenv_config.dart';

import 'core/paths/app_paths.dart';
import 'core/theme/app_theme.dart';
import 'core/providers/index_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnvAppPath.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
