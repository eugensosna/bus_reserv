
import 'package:bus_client/models/bus_route.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  
  const SearchResultPage({super.key});
  


  @override
  Widget build(BuildContext context) {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    final BusRoute route = argList[0];
    final String departureDate = argList[1];


    return Scaffold(
      appBar: AppBar(
        title: const Text("Search results"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Text('Showing results for ${route.cityFrom} to ${route.cityTo}  on $departureDate');
        ],
      ),
    );
  }
}
