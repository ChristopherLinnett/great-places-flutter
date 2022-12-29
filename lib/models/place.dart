import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  const PlaceLocation(
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

  static Place decode({required Map<String, dynamic> mappedPlace}) {
    return Place(
        id: mappedPlace['id'],
        title: mappedPlace['title'],
        location: PlaceLocation(
            latitude: mappedPlace['latitude'],
            longitude: mappedPlace['longitude'],
            address: mappedPlace['address']),
        image: File(mappedPlace['image']));
  }

  Map<String, Object> toMap() {
    return {
      'id': id,
      'title': title,
      'latitude': location.latitude,
      'longitude': location.longitude,
      'address': location.address,
      'image': image.path
    };
  }
}
