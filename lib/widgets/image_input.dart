import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathProvider;

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.imageCallback});
  final Function imageCallback;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (imageFile != null) {
      setState(() {
        _storedImage = File(imageFile.path);
      });
    }
    final appDir = await pathProvider.getApplicationDocumentsDirectory();
    if (_storedImage != null) {
      final filename = path.basename(_storedImage!.path);
      final savedImage = await _storedImage!.copy('${appDir.path}/$filename');
      widget.imageCallback(savedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(_storedImage!,
                  fit: BoxFit.cover, width: double.infinity)
              : Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: TextButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            onPressed: _takePicture,
          ),
        )
      ],
    );
  }
}
