import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/utils/colors.dart';
import 'package:flutter/material.dart';

class SeatPlanePage extends StatefulWidget {
  const SeatPlanePage({Key? key}) : super(key: key);

  @override
  _SeatPlanePageState createState() => _SeatPlanePageState();
}

class _SeatPlanePageState extends State<SeatPlanePage> {
  late BusShedule shedule;
  late String departureDate;
  int totalSeatBooked = 0;
  String bookedSeatNumbers = '';
  List<String> selectedSeats = [];
  bool isFirst = true;
  bool isDataLoading = true;
  ValueNotifier<String> selectedSeatStringNotifer = ValueNotifier('');

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;

    shedule = argList[0];
    departureDate = argList[1];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat plane'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: setBrookedColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Booked",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: setAvialebleColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Available",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: selectedSeatStringNotifer,
                builder: (context, value, _) => Text(
                      'Selected: $value',
                      style: TextStyle(fontSize: 16),
                    )),
            OutlinedButton(onPressed: () {}, child: Text('Next'))
            //Text('Seleted $selectedSeatStringNotifer'),
          ],
        ),
      ),
    );
  }
}
