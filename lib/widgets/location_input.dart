import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _imagePreviewUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
          child: _imagePreviewUrl == null
              ? Text('No Location Selected', textAlign: TextAlign.center)
              : CachedNetworkImage(
                  imageUrl: _imagePreviewUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location',
                  style: Theme.of(context).textTheme.button),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map',
                  style: Theme.of(context).textTheme.button),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}