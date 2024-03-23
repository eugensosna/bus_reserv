import 'package:bus_client/datasource/data_source.dart';
import 'package:bus_client/datasource/dummy_data_source.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  final Datasource _datasource = DummyDataSource();
  Future<BusRoute?> getRouteByCityFromAndCityTo(String cityFrom , String cityTo){
    return _datasource.getRouteByCityFromAndCityTo(cityFrom, cityTo);
  }

}