import '../models/app_user.dart';
import '../models/bus_resevation.dart';

import '../models/auth_response_model.dart';
import '../models/bus_model.dart';
import '../models/bus_shedule.dart';
import '../models/bus_route.dart';
import '../utils/constans.dart';
import '../models/response_model.dart'

abstract class Datasource {
  Future<AuthResponseModel> login(AppUser user);
  Future<ResponseModel> addBus(Bus bus);
  Future<List<Bus>> getAllBus();
  Future <ResponseModel> addRoute(BusRoute busRoute);
   
  }