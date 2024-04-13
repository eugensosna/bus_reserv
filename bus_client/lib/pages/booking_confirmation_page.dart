import 'package:bus_client/models/bus_schedule.dart';
import 'package:flutter/material.dart';

class BokkingConformationPage  extends StatefulWidget {
  const BokkingConformationPage ({Key? key}): super(key: key);

  @override
  State<BokkingConformationPage > createState() =>
      _BokkingConformationPageState();
}

class _BokkingConformationPageState  extends State<BokkingConformationPage > {
  late BusShedule shedule;
  late String departureDate;
  late int totalSeatsBooked;
  late String seatNumbers;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst){
      final argList = ModalRoute.of(context)!.settings.arguments as List;
      departureDate=argList[0];
      shedule=argList[1];
      seatNumbers =argList[2];
      totalSeatsBooked=argList[3];
      isFirst = false;



    }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
