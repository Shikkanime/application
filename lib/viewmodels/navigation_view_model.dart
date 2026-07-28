import 'package:material_ui/material_ui.dart';

class NavigationViewModel extends ChangeNotifier {
  final _pageController = PageController();
  bool _loading = false;
  int _currentIndex = 0;

  PageController get controller => _pageController;

  int get currentIndex => _currentIndex;

  void onChange(int index) {
    if (_loading || _currentIndex == index) return;
    _loading = true;
    _currentIndex = index;
    _pageController.jumpToPage(index);
    _loading = false;
    notifyListeners();
  }
}
