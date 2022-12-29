import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  const LocationInput({super.key, required this.onSelectPlace});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _imagePreviewUrl;

  void _showPreview(double lat, double lon) {
    final staticMapImageUrl =
        LocationHelper.GenerateLocationImage(latitude: lat, longitude: lon);
    setState(() {
      _imagePreviewUrl = staticMapImageUrl;
    });
    widget.onSelectPlace(lat, lon);
  }

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    _showPreview(locationData.latitude ?? 0, locationData.longitude ?? 0);
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
  }

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
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map',
                  style: Theme.of(context).textTheme.button),
              onPressed: _selectOnMap,
            ),
          ],
        )
      ],
    );
  }
}
