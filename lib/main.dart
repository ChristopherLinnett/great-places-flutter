import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
          title: 'Great Places',
          theme: ThemeData(
            colorScheme: const ColorScheme(
              primary: Colors.indigo,
              secondary: Colors.amber,
              error: Colors.red,
              brightness: Brightness.light,
              onPrimary: Colors.white,
              onSecondary: Colors.black,
              onError: Colors.blue,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          initialRoute: PlacesListScreen.routeName,
          routes: {
            PlacesListScreen.routeName: (context) => PlacesListScreen(),
            AddPlaceScreen.routename: (context) => AddPlaceScreen(),
            MapScreen.routeName: (context) => MapScreen(),
          }),
    );
  }
}
