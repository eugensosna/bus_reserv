import '../models/app_user.dart';
import '../models/bus_reservation.dart';

import '../models/auth_response_model.dart';
import '../models/bus_model.dart';
import '../models/bus_shedule.dart';
import '../models/bus_route.dart';
import '../models/response_model.dart';

abstract class Datasource {
  Future<AuthResponseModel> login(AppUser user);
  Future<ResponseModel> addBus(Bus bus);
  Future<List<Bus>> getAllBus();
  Future <ResponseModel> addRoute(BusRoute busRoute);
  Future<List<BusRoute>> getAllRoutes();
  Future <BusRoute?> getRouteByRouteName(String name);
  Future <BusRoute?> getRouteByCityFromAndCityTo(String cityFrom, 
  String cityTo);
  Future <ResponseModel> addShedule(BusShedule busShedule);
  Future <List<BusShedule>> getAllShedules();
  Future <List<BusShedule>> getShedulesByRouteName(String routeName);
  Future <ResponseModel> addReservation(BusReservation reservation);
  
  Future<List <BusReservation>> getAllReservation();
  Future<List <BusReservation>>getReservationByMobile(String mobile);
  Future<List <BusReservation>>getReservationBySheduleAndDepartureDate(int sheduleId,
  String departureDate);
  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate);


   
  }