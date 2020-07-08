import 'dart:io';

import 'dart:convert';

class ImagePlayload {
  String _effect;
  String _image;

  ImagePlayload(String effect, File image) {
    this._effect = effect;
    List<int> imageBytes = image.readAsBytesSync();
    _image = base64.encode(imageBytes);
  }

  Map<String, dynamic> toJson() => {
    'effect': _effect,
    'image': _image,
  };
}