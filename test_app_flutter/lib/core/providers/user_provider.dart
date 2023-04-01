import 'package:test_app_flutter/data/models/user_model.dart';

import 'disposable_provider.dart';

class UserProvider extends DisposableProvider {
  bool _loading = false;
  UserModel _user = const UserModel();

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _loading = false;
    _user = const UserModel();
  }
}
