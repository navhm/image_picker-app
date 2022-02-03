import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function selectImage;
  ImageInput({required this.selectImage});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  //Step 1 With dart:io

  //Step 3 : Camera Open function for button press
  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final imageFile =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile == null) {
      return;
    }
    setState(() {
      //Step 4 : Set the state
      _storedImage = File(imageFile.path);
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.selectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //Step 2 : Image Through file
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Center(child: Text("No Image Taken")),
          height: 150,
          width: 150,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        ),
        SizedBox(
          width: 50,
        ),
        ElevatedButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take Picture'),
        )
      ],
    );
  }
}
