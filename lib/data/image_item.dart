import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageItem {
  int width = 300;
  int height = 300;
  XFile? image;
  Completer loader = Completer();

  ImageItem([dynamic img]) {
    if (img != null) load(img);
  }

  Future get status => loader.future;

  Future load(dynamic imageFile) async {
    loader = Completer();

    dynamic decodedImage;

    if (imageFile is ImageItem) {
      height = imageFile.height;
      width = imageFile.width;
      image = imageFile.image;
      loader.complete(true);
    } else if (imageFile is XFile) {
      image = imageFile;
      decodedImage = await decodeImageFromList(await imageFile.readAsBytes());
    } else {
      image = XFile(imageFile.path); // Assuming imageFile is a File or similar
      decodedImage = await decodeImageFromList(await imageFile.readAsBytes());
    }

    // image was decoded
    if (decodedImage != null) {
      height = decodedImage.height;
      width = decodedImage.width;
      loader.complete(decodedImage);
    }

    return true;
  }
}
