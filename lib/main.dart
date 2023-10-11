import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_tool/image_picker.dart';

void main() {
  runApp(
   MaterialApp(
      home: ImageEditorExample(),
    ),
  );
}

class ImageEditorExample extends StatefulWidget {
  const ImageEditorExample({
    super.key,
  });

  @override
  createState() => _ImageEditorExampleState();
}

class _ImageEditorExampleState extends State<ImageEditorExample> {
  Uint8List? imageData;

  @override
  void initState() {
    super.initState();
    // loadAsset("image.jpg");
  }

  // void loadAsset(String name) async {
  //   var data = await rootBundle.load('assets/$name');
  //   setState(() => imageData = data.buffer.asUint8List());
  // }
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker? _picker = ImagePicker();
    final XFile? image = await _picker!.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // The user canceled image selection.
      return;
    }

    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title:const Text('Image Editor')),
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageFile != null)
              Image.file(
                
                File(_imageFile!.path), 
                width: 400.0,
                height: 400.0,
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
             Center(
            child: ElevatedButton(
              child: const Text("Picked Image"),
              onPressed: () async {
               
                var editedImage = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageEditor(
                      image: _imageFile!,
                    ),
                  ),
                );

                // replace with edited image
                if (editedImage != null) {
                 _imageFile = editedImage;
                  setState(() {});
                }
              },
            ),
          ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("ImageEditor Example"),
    //     centerTitle: true,
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       if (imageData != null) Image.memory(imageData!),
    //       const SizedBox(height: 16),
    //       Center(
    //         child: ElevatedButton(
    //           child: const Text("Picked Image"),
    //           onPressed: () async {
               
    //             // var editedImage = await Navigator.push(
    //             //   context,
    //             //   MaterialPageRoute(
    //             //     builder: (context) => ImageEditor(
    //             //       image: imageData,
    //             //     ),
    //             //   ),
    //             // );

    //             // // replace with edited image
    //             // if (editedImage != null) {
    //             //   imageData = editedImage;
    //             //   setState(() {});
    //             // }
    //           },
    //         ),
    //       ),
    //       // ElevatedButton(
    //       //   child: const Text("Multiple image editor"),
    //       //   onPressed: () async {
    //       //     var editedImage = await Navigator.push(
    //       //       context,
    //       //       MaterialPageRoute(
    //       //         builder: (context) => ImageEditor(
    //       //           images: [
    //       //             imageData,
    //       //             imageData,
    //       //           ],
    //       //         ),
    //       //       ),
    //       //     );

    //       //     // replace with edited image
    //       //     if (editedImage != null) {
    //       //       imageData = editedImage;
    //       //       setState(() {});
    //       //     }
    //       //   },
    //       // ),
    //     ],
    //   ),
    // );
  }
}