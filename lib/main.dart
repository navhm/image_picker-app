import 'package:flutter/material.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import 'providers/great_places.dart';
import 'screens/places_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.blue[800],
          primaryColor: Colors.blue[800],
          // backgroundColor: Colors.orange[800],
        ),
        home: PLacesListScreen(),
        routes: {
          AddPlaceScreen.routName: (context) => AddPlaceScreen(),
        },
      ),
    );
  }
}
