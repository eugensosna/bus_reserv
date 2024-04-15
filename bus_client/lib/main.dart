//import 'dart:js'7;

import 'package:bus_client/pages/booking_confirmation_page.dart';
import 'package:bus_client/pages/search_page.dart';
import 'package:bus_client/pages/search_result_page.dart';
import 'package:bus_client/pages/seat_plane_page.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppDataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,

        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
        //home: const SearchPage(),
        initialRoute: routeNameHome,
      routes:{
        routeNameHome: (context) => const SearchPage(),
        routeNameSearchResultPage: (context) => const SearchResultPage(),
          routeNameSeatPlanPage: (context) => const SeatPlanPage(),
          routeNameBookingConfirmationPage: (context) =>
              const BookingConfirmationPage(),
          // routeNameAddBusPage
      }


    );
  }
}
