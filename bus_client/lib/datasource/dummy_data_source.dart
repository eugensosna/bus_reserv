import 'package:bus_client/datasource/data_source.dart';
import 'package:bus_client/datasource/temp_db.dart';
import 'package:bus_client/models/app_user.dart';
import 'package:bus_client/models/auth_response_model.dart';
import 'package:bus_client/models/bus_model.dart';
import 'package:bus_client/models/bus_reservation.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/models/response_model.dart';
import 'package:bus_client/utils/constants.dart';

class DummyDataSource extends Datasource {
  @override
  Future<ResponseModel> addBus(Bus bus) {
    // TODO: implement addBus
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addReservation(BusReservation reservation) async {
    TempDB.tableReservation.add(reservation);
    return ResponseModel(
        responseStatus: ResponseStatus.SAVED,
        statusCode: 200,
        message: 'Your reservation has been saved',
        object: {});

  }

  @override
  Future<ResponseModel> addRoute(BusRoute busRoute) {
    // TODO: implement addRoute
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addShedule(BusShedule busShedule) {
    // TODO: implement addShedule
    throw UnimplementedError();
  }

  @override
  Future<List<Bus>> getAllBus() {
    // TODO: implement getAllBus
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getAllReservation() {
    // TODO: implement getAllReservation
    throw UnimplementedError();
  }

  @override
  Future<List<BusRoute>> getAllRoutes() {
    // TODO: implement getAllRoutes
    throw UnimplementedError();
  }

  @override
  Future<List<BusShedule>> getAllShedules() {
    // TODO: implement getAllShedules
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationByMobile(String mobile) {
    // TODO: implement getReservationByMobile
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationBySheduleAndDepartureDate(
      int sheduleId, String departureDate) {
    // TODO: implement getReservationBySheduleAndDepartureDate
    throw UnimplementedError();
  }
  
  @override
  Future<List<BusReservation>> getReservationsBysheduleAndDepartureDate(
      int sheduleId, String departureDate) async {
    return TempDB.tableReservation
        .where((element) =>
            element.busShedule.sheduleId == sheduleId &&
            element.depatureDate == departureDate)
        .toList();
  }

  @override
  Future<BusRoute?> getRouteByCityFromAndCityTo (String cityFrom, String cityTo) async {
    try{
    final BusRoute route = TempDB.tableRoute.firstWhere(
        (element) => element.cityFrom == cityFrom && element.cityTo == cityTo);
    return route;
    } on StateError catch (error) {
      print(error.toString());
        return null;
    }
  }

  @override
  Future<BusRoute?> getRouteByRouteName(String name) {
    // TODO: implement getRouteByRouteName
    throw UnimplementedError();
  }

  @override
  Future<List<BusShedule>> getShedulesByRouteName(String routeName) async {
    return TempDB.tableshedule
        .where((element) => element.busRoute.routeName == routeName)
        .toList();
    //return TempDB.tableshedule.where((shedule) => )
  }

  @override
  Future<AuthResponseModel> login(AppUser user) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
