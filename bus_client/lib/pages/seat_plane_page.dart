import 'package:bus_client/customswidgets/seat_plan_view.dart';
import 'package:bus_client/models/bus_schedule.dart';
import 'package:bus_client/utils/colors.dart';
import 'package:bus_client/utils/helper_functions.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import "package:bus_client/utils/constants.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({super.key});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  late BusShedule shedule;
  late String departureDate;
  int totalSeatBooked = 0;
  String bookedSeatNumbers = '';
  List<String> selectedSeats = [];
  bool isFirst = true;
  bool isDataLoading = true;
  ValueNotifier<String> selectedSeatStringNotifier = ValueNotifier('');

  @override
  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    shedule = argList[0];
    departureDate = argList[1];
    _getData();
    super.didChangeDependencies();
  }

  _getData() async {
    final resList = await Provider.of<AppDataProvider>(context, listen: false)
        .getReservationsBysheduleAndDepartureDate(
            shedule.sheduleId!, departureDate);
    setState(() {
      isDataLoading = false;
    });
    List<String> seats = [];
    for (final res in resList) {
      totalSeatBooked += res.totalSeatBooked;
      seats.add((res.seatNumber));
    }
    bookedSeatNumbers = seats.join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Plan'),
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
                          color: seatBookedColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Booked',
                          style: TextStyle(fontSize: 16),
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
                          color: seatAvailableColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Available',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: selectedSeatStringNotifier,
              builder: (context, value, _) => Text(
                'Selected: $value',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            if (!isDataLoading)
              Expanded(
                child: SingleChildScrollView(
                  child: SeatPlanView(
                    onSeatSelected: (value, seat) {
                      if (value) {
                        selectedSeats.add(seat);
                      } else {
                        selectedSeats.remove(seat);
                      }
                      selectedSeatStringNotifier.value =
                          selectedSeats.join(',');
                    },
                    totalSeatBooked: totalSeatBooked,
                    bookedSeatNumbers: bookedSeatNumbers,
                    totalSeat: shedule.bus.totalSeat,
                    isBusinessClass: shedule.bus.busType == busTypeACBusiness,
                  ),
                ),
              ),
            OutlinedButton(
              onPressed: () {
                if (selectedSeats.isEmpty) {
                  showMsg(context, 'Please select your seat first');
                  return;
                }
                Navigator.pushNamed(context, routeNameBookingConfirmationPage,
                    arguments: [
                      departureDate,
                      shedule,
                      selectedSeatStringNotifier.value,
                      selectedSeats.length
                    ]);
              },
              child: const Text('NEXT'),
            )
          ],
        ),
      ),
    );
  }
}
