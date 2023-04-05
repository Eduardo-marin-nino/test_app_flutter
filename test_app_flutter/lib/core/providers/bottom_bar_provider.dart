import 'disposable_provider.dart';

class BottomBarProvider extends DisposableProvider {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _currentPage = 0;
  }
}
