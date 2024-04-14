import 'package:bus_client/models/bus_reservation.dart';
import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/models/customer.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:bus_client/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingConfirmationPage extends StatefulWidget {
  const BookingConfirmationPage({super.key});

  @override
  State<BookingConfirmationPage> createState() =>
      _BookingConfirmationPageState();
}

class _BookingConfirmationPageState extends State<BookingConfirmationPage> {
  late BusShedule shedule;
  late String departureDate;
  late int totalSeatsBooked;
  late String seatNumbers;
  bool isFirst = true;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = "Mr.ABC";
    mobileController.text = "123";
    emailController.text = "email";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirst) {
      final argList = ModalRoute.of(context)!.settings.arguments as List;
      departureDate = argList[0];
      shedule = argList[1];
      seatNumbers = argList[2];
      totalSeatsBooked = argList[3];
      isFirst = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmin Booking'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.8),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please provide your informaton',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Customer name',
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(
                  hintText: 'Mobile number',
                  filled: true,
                  prefixIcon: Icon(Icons.call),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email adress',
                  filled: true,
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ), //Email adress
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Booking summary',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customer name: ${nameController.text}'),
                    Text('Mobile number: ${mobileController.text}'),
                    Text('Customer name: ${emailController.text}'),
                    Text('Route: ${shedule.busRoute.routeName}'),
                    Text('Departure Date: ${departureDate}'),
                    Text('Departure Time: ${shedule.departureTime}'),
                    Text('Ticket Price: $currency${shedule.ticketPrice}'),
                    Text('Total Seat(s): $totalSeatsBooked'),
                    Text('Seat Number(s): $seatNumbers'),
                    Text('Discount: ${shedule.discount}'),
                    Text('Processing Fee : ${shedule.processingFee}'),
                    Text(
                      'Grand Total : $currency${getGrandTotal(shedule.discount, totalSeatsBooked, shedule.ticketPrice, shedule.processingFee)}',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: const Text('Confirm Booking'),
            )
          ],
        ),
      ),
    );
  }

  void _confirmBooking() {
    if (_formKey.currentState!.validate()) {
      final customer = Customer(
          name: nameController.text,
          email: emailController.text,
          mobile: mobileController.text);
      final reservation = BusReservation(
          customer: customer,
          busShedule: shedule,
          timestamp: DateTime.now().microsecondsSinceEpoch,
          depatureDate: departureDate,
          totalSeatBooked: totalSeatsBooked,
          seatNumber: seatNumbers,
          reservationStatus: reservationActive,
          totalPrice: getGrandTotal(shedule.discount, totalSeatsBooked,
              shedule.ticketPrice, shedule.processingFee));
      Provider.of<AppDataProvider>(context, listen: false)
          .addReservation(reservation)
          .then((response) {
        if (response.responseStatus == ResponseStatus.SAVED) {
          showMsg(context, response.message);
          Navigator.popUntil(context, ModalRoute.withName(routeNameHome));
        } else {
          showMsg(context, response.message);
        }
      }).catchError((error) {
        showMsg(context, 'Could not save sS{error}');
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    super.dispose();
  }
  

}
