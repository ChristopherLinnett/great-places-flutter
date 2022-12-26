import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
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
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
