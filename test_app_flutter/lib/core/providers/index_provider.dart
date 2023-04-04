import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:test_app_flutter/core/providers/bottom_bar_provider.dart';

import 'disposable_provider.dart';

class AppProviders {
  static List<DisposableProvider> _getDisposableProviders(
    BuildContext context,
  ) {
    return [
      context.read<BottomBarProvider>(),
    ];
  }

  static List<SingleChildWidget> storeProviders = [
    ChangeNotifierProvider(create: (_) => BottomBarProvider()),
  ];

  static Future<void> disposeAllDisposableProviders(
    BuildContext context,
  ) async {
    await Future.forEach(
      _getDisposableProviders(context),
      (DisposableProvider provider) async {
        provider.disposeValues();
      },
    );
  }
}
