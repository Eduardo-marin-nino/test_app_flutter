import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import 'disposable_provider.dart';

class AppProviders {
  static List<DisposableProvider> _getDisposableProviders(
    BuildContext context,
  ) {
    return [];
  }

  static List<SingleChildWidget> storeProviders = [];

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
