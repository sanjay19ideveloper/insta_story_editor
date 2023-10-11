import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class ImageEditorExample extends StatefulWidget {
  final Uint8List? imageData;

  const ImageEditorExample({
    super.key,
    this.imageData,
  });

  @override
  createState() => _ImageEditorExampleState();
}

class _ImageEditorExampleState extends State<ImageEditorExample> {
  Uint8List? editedImageResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Selected Image',
            style: TextStyle(
              color: Color(0xFF2E3134),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.imageData != null)
            Image.memory(editedImageResult ?? widget.imageData!),
          const SizedBox(height: 16),
          InkWell(
            onTap: () async {
              var editedImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageEditor(
                    image: widget.imageData,
                  ),
                ),
              );

              // replace with edited image
              if (editedImage != null) {
                editedImageResult = editedImage;
                setState(() {});
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                  size: 24.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
