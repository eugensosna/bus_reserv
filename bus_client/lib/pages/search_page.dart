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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Form(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(8) ,
            shrinkWrap: true,
            children: [
              DropdownButtonFormField(
                
                value: fromCity,
                validator: (value) {
                  if(value== null|| value.isEmpty){
                    return emptyFieldErrMessage;
                  }
                  return null; 
                },
                hint: const Text("Fom"),
                isExpanded: true,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white)
                ),
                items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city)) ).toList(), 
                onChanged: (value){
                  setState(() {
                    fromCity = value;
                  });

                }),
                const SizedBox(height: 10,),
                DropdownButtonFormField(
                
                value: toCity,
                validator: (value) {
                  if(value== null|| value.isEmpty){
                    return emptyFieldErrMessage;
                  }
                  return null; 
                },
                hint:  Text("To" ),
                isExpanded: true,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white)
                ),
                items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city)) ).toList(), 
                onChanged: (value){
                  setState(() {
                    toCity = value;
                  });

                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: _selectDate,
                    child: const Text('Select Departure Date'),
                    ),
                    Text(departureDate == null ? "No date chosen": getFormattedDate(departureDate!, pattern: 'EEE MMM dd, yyyy'))
                  ],
                )

                // dropDownFromCiy(toCity, "To")
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
        lastDate: DateTime.now().add(const Duration(days: 7))
        );
    if (selectedDate!= null){
      setState(() {
        departureDate = selectedDate as DateTime?;   
      });
      
    }
  }
}
