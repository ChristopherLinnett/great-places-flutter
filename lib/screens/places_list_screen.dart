import 'package:flutter/material.dart';
import 'package:great_places/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});
  static const routeName = '/PlaceListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routename);
              },
            )
          ],
        ),
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ));
  }
}
