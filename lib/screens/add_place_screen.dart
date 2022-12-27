import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});
  static const routename = '/AddPlaceName';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _pickedImage;

  void selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace(BuildContext context) {
    if (_textEditingController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_textEditingController.text, _pickedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _textEditingController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(imageCallback: selectImage)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Submit'),
            onPressed: () {
              _savePlace(context);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
      ),
    );
  }
}
