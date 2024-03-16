import 'bus_model.dart';
import 'bus_route.dart';

class BusShedule {
  int? sheduleId;
  Bus bus;
  BusRoute busRoute;
  String depatureTime;
  int ticketPrice;
  int discount;
  int processingFee;

  BusShedule({
    this.sheduleId,
    required this.bus,
    required this.busRoute,
    required this.depatureTime,
    required this.ticketPrice,
    this.discount =0,
    this.processingFee = 0
  
  });

}