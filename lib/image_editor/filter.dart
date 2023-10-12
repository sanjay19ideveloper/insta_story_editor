import 'package:flutter/material.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class PreviewPage extends StatefulWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  TextureSource? texture;
  BrightnessShaderConfiguration? configuration;
  bool textureLoaded = false;

  @override
  void initState() {
    super.initState();
    configuration = BrightnessShaderConfiguration();
    configuration!.brightness = 0.5;

    // Use Image.network to load the image from a URL.
    Image.network('https://cdn.pixabay.com/photo/2023/07/20/19/42/flower-8140215_1280.jpg')
        .image
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener((info, call) {
      setState(() {
        texture = TextureSource.fromImage(info.image);
        textureLoaded = true;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return textureLoaded
        ? ImageShaderPreview(
            texture: texture!,
            configuration: configuration!,
          )
        : const Offstage();
  }
}
