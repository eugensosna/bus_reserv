import 'bus_shedule.dart';

import 'customer.dart';

class BusReservation {
  int? reservationId;
  Customer customer;
  BusShedule busShedule;
  int timestamp;
  String depatureDate;
  int totalSeatBooked;
  String seatNumber;
  String reservationStatus;
  int totalPrice;

  BusReservation({
    this.reservationId,
    required this.customer,
    required this.busShedule,
    required this.timestamp,
    required this.depatureDate,
    required this.totalSeatBooked,
    required this.seatNumber,
    required this.reservationStatus,
    required this.totalPrice

  });
}