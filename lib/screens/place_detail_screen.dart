import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key});
  static const String routeName = '/PlaceDetailScreen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    if (id != null){}
    final selectedPlace =
        Provider.of<GreatPlaces>(context, listen: false).findPlaceById(id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedPlace.title),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text(selectedPlace.location.address,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10),
            MaterialButton(
              child: Text('View On Map'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MapScreen(initialLocation: selectedPlace.location),
                    fullscreenDialog: true));
              },
            )
          ],
        ));
  }
}
