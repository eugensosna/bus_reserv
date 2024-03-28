import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Text(
            'Showing results for ${route.cityFrom} to ${route.cityTo}  on $departureDate',
            style: const TextStyle(fontSize: 12),
          ),
          Consumer<AppDataProvider>(
              builder: (context, provider, _) =>
                  FutureBuilder<List<BusShedule>>(
                      future: provider.getShedulesByRouteName(route.routeName),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final sheduleList = snapshot.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: sheduleList!
                                .map((shedule) => ScheduleItemView(
                                      shedule: shedule,
                                      date: departureDate,
                                    ))
                                .toList(),
                          );
                        }
                        return const Text('Please wait');
                      }))
        ],
      ),
    );
  }
}

class ScheduleItemView extends StatelessWidget {
  final String date;
  final BusShedule shedule;

  const ScheduleItemView(
      {super.key, required this.date, required this.shedule});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeNameSeatPlanPage,
          arguments: [shedule, date]),
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(shedule.bus.busName),
            subtitle: Text(shedule.bus.busType),
            trailing: Text('$currency${shedule.ticketPrice}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'From: ${shedule.busRoute.cityFrom}',
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  'To: ${shedule.busRoute.cityTo}',
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Departure Time: ${shedule.departureTime}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Total seat: ${shedule.bus.totalSeat}',
                  style: const TextStyle(fontSize: 19),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
