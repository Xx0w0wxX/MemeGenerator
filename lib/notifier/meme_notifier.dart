import 'dart:math';

import 'package:flutter/material.dart';

class MemeNotifier extends ChangeNotifier {
  String imageUrl = '';
  String vocabulary = '';
  String description = '';
  Image img;
  bool isImageSet = false;

  Color vocaburaryColor = Colors.pinkAccent;
  Color descriptionColor = Colors.lightGreen;

  final TextEditingController imageUrlTextEditingController =
      TextEditingController();
  final TextEditingController vocaburaryTextEditingController =
      TextEditingController();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();

  Future<Image> fetchImage() async {
    final img = Image.network(imageUrlTextEditingController.text);
    return img;
  }

  void setIsImageUrl(bool value) {
    isImageSet = value;
    notifyListeners();
  }

  void setRandomColor(Color text) {
    text = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0);
    notifyListeners();
  }
}
