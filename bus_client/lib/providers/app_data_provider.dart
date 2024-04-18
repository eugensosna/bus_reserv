import 'package:bus_client/datasource/data_source.dart';
import 'package:bus_client/datasource/dummy_data_source.dart';
import 'package:bus_client/models/bus_model.dart';
import 'package:bus_client/models/bus_reservation.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/models/response_model.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  List<Bus> _busList = [];
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
  Future<ResponseModel> addBus(Bus bus) {
    return _datasource.addBus(bus);
  }
  Future<ResponseModel> addRoute(BusRoute route) {
    return _datasource.addRoute(route);
  }
}
