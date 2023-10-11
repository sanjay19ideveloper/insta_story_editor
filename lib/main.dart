import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_editor/edit_image.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Create Story', style: TextStyle(
            color: Color(0xFF2E3134),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
           
          ),
        )),
      body:   Center(
            child: ElevatedButton(
              style:ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.black),
                 )
              ,
              onPressed: (){
              showImagePickerDialog(context);
            }, child: SizedBox(
              width: 80,
              child: Row(

                children: const [
                  Icon(Icons.add),

                  Text('Create',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
          ),),
                ],
              ),
            )),
          )
    );
  }

  Future<Uint8List?> showImagePickerDialog(BuildContext context) async {
    try {
      final imagePicker = ImagePicker();
      final source = await showDialog<ImageSource>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Select Image Source"),
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, ImageSource.camera),
                child: const Text("Camera"),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, ImageSource.gallery),
                child: const Text("Gallery"),
              ),
            ],
          );
        },
      );

      if (source != null) {
        XFile? pickedFile = await imagePicker.pickImage(source: source);

        if (pickedFile != null) {
          Uint8List? file = await pickedFile.readAsBytes();
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ImageEditorExample(
                        imageData: file,
                      )));
          return file;
        }
      }
    } catch (e) {
      // Handle any exceptions that may occur during image picking.
      print("Error picking image: $e");
      return null;
    }
    return null;
  }
}
