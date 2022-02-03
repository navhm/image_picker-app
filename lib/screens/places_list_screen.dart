import 'package:flutter/material.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PLacesListScreen extends StatelessWidget {
  const PLacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Places"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routName);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Consumer<GreatPlaces>(
            child: Center(child: const Text("Got no places yet")),
            builder: (context, greatPlaces, ch) => greatPlaces.items.length <= 0
                ? ch!
                : ListView.builder(
                    itemBuilder: (context, i) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(greatPlaces.items[i].image),
                      ),
                      title: Text(greatPlaces.items[i].title),
                      onTap: () {},
                    ),
                    itemCount: greatPlaces.items.length,
                  )));
  }
}
