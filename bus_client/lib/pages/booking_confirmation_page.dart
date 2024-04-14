import 'package:bus_client/models/bus_shedule.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:flutter/material.dart';

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
    if (isFirst){
      final argList = ModalRoute.of(context)!.settings.arguments as List;
      departureDate=argList[0];
      shedule=argList[1];
      seatNumbers =argList[2];
      totalSeatsBooked=argList[3];
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: mobileController,
                decoration: const InputDecoration(
                  hintText: 'Mobile number',
                  filled: true,
                  prefixIcon: Icon(Icons.e_mobiledata),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
