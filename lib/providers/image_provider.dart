import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

class ImageProvider extends ChangeNotifier {
  String? _selectedImage;

  String? get selectedImage => _selectedImage;

  void updateSelectedImage(String imagePath) {
    _selectedImage = imagePath;
    notifyListeners();
  }
}
