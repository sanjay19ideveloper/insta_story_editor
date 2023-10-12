import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:text_editor/text_editor.dart';




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
   final fonts = [
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];
  TextStyle _textStyle = TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'BunchBlossoms',
  );
  String _text = 'Sample Text';
  TextAlign _textAlign = TextAlign.center;
   void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(
        milliseconds: 400,
      ), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Container(
          color: Colors.black.withOpacity(0.4),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              // top: false,
              child: Container(
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  textAlingment: textAlign,
                  minFontSize: 10,
                  // paletteColors: [
                  //   Colors.black,
                  //   Colors.white,
                  //   Colors.blue,
                  //   Colors.red,
                  //   Colors.green,
                  //   Colors.yellow,
                  //   Colors.pink,
                  //   Colors.cyanAccent,
                  // ],
                  // decoration: EditorDecoration(
                  //   textBackground: TextBackgroundDecoration(
                  //     disable: Text('Disable'),
                  //     enable: Text('Enable'),
                  //   ),
                  //   doneButton: Icon(Icons.close, color: Colors.white),
                  //   fontFamily: Icon(Icons.title, color: Colors.white),
                  //   colorPalette: Icon(Icons.palette, color: Colors.white),
                  //   alignment: AlignmentDecoration(
                  //     left: Text(
                  //       'left',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     center: Text(
                  //       'center',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     right: Text(
                  //       'right',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                      _textAlign = align;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
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
                  builder: (context) => 
                  // StoriesEditor(giphyKey: 'wLfKlamIVJ4QkhCvqBHp0jr2OmOC29aF',
                  //           //fontFamilyList: const ['Shizuru', 'Aladin'],
                  //           galleryThumbnailQuality: 300,
                  //         isCustomFontList: true,
                  //           onDone: (uri) {
                  //             debugPrint(uri);
                  //             Share.shareFiles([uri]);}
                  ImageEditor(
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
          ),
          SizedBox(height: 10,),
          Center(
            child: GestureDetector(
             
                 onTap: () => _tapHandler(_text, _textStyle, _textAlign),
                
            
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red[800],
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
            ),
          ),
        ],
      ),
    );
  }
}
