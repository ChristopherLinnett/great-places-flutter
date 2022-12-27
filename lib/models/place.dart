import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation(
      {required this.latitude, required this.longitude, this.address = ''});
  Map<String, Object> toMap() {
    return {'latitude': latitude, 'longitude': longitude, 'address': address};
  }
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'location': location.toMap(),
      'image': image.path
    };
  }
}
