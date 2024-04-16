import 'package:bus_client/datasource/temp_db.dart';
import 'package:bus_client/models/bus_model.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:bus_client/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBusPage extends StatefulWidget {
  const AddBusPage({super.key});

  @override
  State<AddBusPage> createState() => _AddBusPageState();
}

class _AddBusPageState extends State<AddBusPage> {
  final _formKey = GlobalKey<FormState>();
  String? busType;
  final seatController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bus'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            shrinkWrap: true,
            children: [
              DropdownButtonFormField<String>(
                items: busTypes
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    busType = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please select a bus Type';
                  }
                },
                value: busType,
                isExpanded: true,
                decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.white70)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Bus Name',
                    filled: true,
                    prefixIcon: Icon(Icons.bus_alert),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return emptyFieldErrMessage;
                    }
                    return null;
                  }),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: numberController,
                decoration: InputDecoration(
                  hintText: 'Bus Number',
                  filled: true,
                  prefixIcon: const Icon(Icons.bus_alert),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: seatController,
                decoration: const InputDecoration(
                  hintText: 'Total Seats',
                  filled: true,
                  prefixIcon: Icon(Icons.bus_alert),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  child: ElevatedButton(
                    child: const Text('Add Bus'),
                    onPressed: addBus,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addBus() {
    if (_formKey.currentState!.validate()) {
      final Bus bus = Bus(
          busId: TempDB.tableBus.length + 1,
          busName: nameController.text,
          busNumber: numberController.text,
          busType: busType!,
          totalSeat: int.parse(seatController.text));

      Provider.of<AppDataProvider>(context, listen: false)
          .addBus(bus)
          .then((value) {
        if (value.responseStatus == ResponseStatus.SAVED) {
          showMsg(context, 'Bus added ');
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    seatController.dispose();
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
