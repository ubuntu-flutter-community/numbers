import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

class Settings extends ChangeNotifier {
  ThemeMode? _theme;
  YaruVariant? _variant;

  ThemeMode? get theme => _theme;
  void setTheme(ThemeMode value) {
    if (_theme == value) return;
    _theme = value;
    notifyListeners();
  }

  YaruVariant? get variant => _variant;
  void setVariant(YaruVariant value) {
    if (_variant == value) return;
    _variant = value;
    notifyListeners();
  }
}
