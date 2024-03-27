import 'package:bus_client/datasource/data_source.dart';
import 'package:bus_client/datasource/dummy_data_source.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/models/bus_shedule.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  List<BusShedule> _sheduleList = [];
  List<BusShedule> get sheduleList => _sheduleList;
  final Datasource _datasource = DummyDataSource();
  Future<BusRoute?> getRouteByCityFromAndCityTo(String cityFrom , String cityTo){
    return _datasource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }
   Future <List<BusShedule>> getShedulesByRouteName  (String routeName) async {
    return _datasource.getShedulesByRouteName(routeName);
    
   }

}