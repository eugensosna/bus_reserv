import 'package:bus_client/datasource/temp_db.dart';
import 'package:bus_client/models/bus_route.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddRoutePageState createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  final _formKey = GlobalKey<FormState>();
  String? from, to;
  final distanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Route'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            addAutomaticKeepAlives: true,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            //shrinkWrap: true,
            children: [
              stanartSizeBox(),
              DropdownButtonFormField<String>(
                items: cities
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
                hint: const Text('From'),
              ),
              stanartSizeBox(),
              DropdownButtonFormField<String>(
                items: cities
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    to = value;
                  });
                },
                hint: const Text('To'),
              ),
              stanartSizeBox(),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: distanceController,
                decoration: const InputDecoration(
                    hintText: 'Distance in Kilometer',
                    filled: true,
                    prefixIcon: Icon(Icons.social_distance)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
              ),
              stanartSizeBox(),
              Center(
                child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: addRoute,
                      child: const Text('ADD ROUTE'),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget stanartSizeBox({double heightsize = 5}) {
    return SizedBox(
      height: heightsize,
    );
  }

  void addRoute() {
    if (_formKey.currentState!.validate()) {
      final route = BusRoute(
          routeId: TempDB.tableRoute.length + 1,
          routeName: '$from-$to',
          cityFrom: from!,
          cityTo: to!,
          distanceInKm: double.parse(distanceController.text));
      Provider.of<AppDataProvider>(context, listen: false)
          .addRoute(route)
          .then((value) => null);
    }
  }

  @override
  void dispose() {
    distanceController.dispose();

    super.dispose();
  }

  resetFields() {
    distanceController.clear();
  }
}
