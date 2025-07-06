import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentState extends ChangeNotifier {
  /// Theme Logic
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  Color _textThemeColor = Colors.black;
  Color _backgroundColor = Colors.white;

  Color get textThemeColor => _textThemeColor;
  Color get backgroundColor => _backgroundColor;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    _textThemeColor = _isDarkMode ? Colors.white : Colors.black;
    _backgroundColor = _isDarkMode ? const Color(0xFF1B1C16) : Colors.white;
    notifyListeners();
  }

  /// App Navigation Logic
  Widget currentScreen = const Placeholder(); // Default placeholder
  bool isMainScrren = true;
  String? title;

  void changePhoneScreen(Widget screen, bool isMain, {String? titleL}) {
    currentScreen = screen;
    isMainScrren = isMain;
    title = titleL;
    notifyListeners();
  }

  /// Link Launcher
  Future<void> launchInBrowser(String link) async {
    Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Something went wrong while launching URL");
    }
  }
}
