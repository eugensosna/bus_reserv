import 'package:bus_client/datasource/data_source.dart';
import 'package:bus_client/datasource/dummy_data_source.dart';
import 'package:bus_client/datasource/temp_db.dart';
import 'package:bus_client/models/bus_model.dart';
import 'package:bus_client/models/bus_reservation.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/models/bus_schedule.dart';
import 'package:bus_client/models/reservation_expansion_item.dart';
import 'package:bus_client/models/response_model.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Bus> _busList = [];
  List<BusRoute> _routeList = [];
  List<BusReservation> _reservationList = [];
  List<BusReservation> get reservationList => _reservationList;


  List<BusRoute> get routeList => _routeList;

  List<Bus> get busList =>_busList;
  final List<BusShedule> _sheduleList = [];
  List<BusShedule> get sheduleList => _sheduleList;
  final Datasource _datasource = DummyDataSource();
  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) {
    return _datasource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }

  Future<List<BusShedule>> getShedulesByRouteName(String routeName) async {
    return _datasource.getShedulesByRouteName(routeName);
  }
  
  Future<List<BusReservation>> getReservationsBysheduleAndDepartureDate(
      int sheduleId, String departureDate) {
    return _datasource.getReservationsBysheduleAndDepartureDate(
        sheduleId, departureDate);
  }
  Future<ResponseModel> addReservation(BusReservation reservation) {
    return _datasource.addReservation(reservation);
  }

  Future<List<BusReservation>> getAllReservation() async {
    _reservationList = await _datasource.getAllReservation();
    notifyListeners();
    return _reservationList;
  } 

  Future<List<BusReservation>> getReservationsByMobile(String mobile) async {
    return _datasource.getReservationByMobile(mobile);
  }
  Future<ResponseModel> addBus(Bus bus) {
    final result = _datasource.addBus(bus);
    _busList = TempDB.tableBus.toList();
    return result;
  }
  Future<ResponseModel> addRoute(BusRoute route) {
    return _datasource.addRoute(route);
  }


  List<ReservationExpansionItem> getExpansionItems(
      List<BusReservation> reservationList) {
    return List.generate(reservationList.length, (index) {
      final reservation = reservationList[index];
      return ReservationExpansionItem(
        header: ReservationExpansionHeader(
          reservationId: reservation.reservationId,
          departureDate: reservation.depatureDate,
          schedule: reservation.busShedule,
          timestamp: reservation.timestamp,
          reservationStatus: reservation.reservationStatus,
        ),
        body: ReservationExpansionBody(
          customer: reservation.customer,
          totalSeatedBooked: reservation.totalSeatBooked,
          seatNumbers: reservation.seatNumber,
          totalPrice: reservation.totalPrice,
        ),
      );
    });
  }

}
