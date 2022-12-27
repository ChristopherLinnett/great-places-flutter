import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: UniqueKey().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: PlaceLocation(latitude: 0, longitude: 0),
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(collection: 'places', data: newPlace.toMap());
  }
}
