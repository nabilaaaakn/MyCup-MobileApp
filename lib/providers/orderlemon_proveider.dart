import 'package:flutter/material.dart';

class SelectionProvider extends ChangeNotifier {
  String _selected = '';
  String _hovered = '';

  String get selected => _selected;
  String get hovered => _hovered;

  void setHovered(String value) {
    _hovered = value;
    notifyListeners();
  }

  void setSelected(String value) {
    _selected = value;
    notifyListeners();
  }
}
