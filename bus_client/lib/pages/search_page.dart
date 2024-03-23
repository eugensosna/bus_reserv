import 'package:bus_client/datasource/temp_db.dart';
import 'package:bus_client/utils/constants.dart';
import 'package:bus_client/utils/helper_functions.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? fromCity, toCity;
  DateTime? departureDate;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              children: [
                DropdownButtonFormField(
                    value: fromCity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return emptyFieldErrMessage;
                      }
                      return null;
                    },
                    hint: const Text("Fom"),
                    isExpanded: true,
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white)),
                    items: cities
                        .map((city) => DropdownMenuItem<String>(
                            value: city, child: Text(city)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        fromCity = value;
                      });
                    }),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    value: toCity,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return emptyFieldErrMessage;
                      }
                      return null;
                    },
                    hint: Text("To"),
                    isExpanded: true,
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.white)),
                    items: cities
                        .map((city) => DropdownMenuItem<String>(
                            value: city, child: Text(city)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        toCity = value;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _selectDate,
                      child: const Text('Select Departure Date'),
                    ),
                    Text(departureDate == null
                        ? "No date chosen"
                        : getFormattedDate(departureDate!,
                            pattern: 'EEE MMM dd, yyyy'))
                  ],
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: _search,
                      child: const Text('Search'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)));
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate as DateTime?;
      });
    }
  }

  void _search() {
    if (departureDate == null) {
      showMsg(context, emptyDateErrMessage);
      return;
    }
    if (_formKey.currentState!.validate()) {
      try {
        final route = TempDB.tableRoute.firstWhere((element) =>
            element.cityFrom == fromCity && element.cityTo == toCity);
            showMsg(context, route.routeName);
      } on StateError catch (error) {

        showMsg(context, 'No route found');
      }
    }
  }
}