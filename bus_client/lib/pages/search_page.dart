import 'package:bus_client/utils/constants.dart';
import 'package:flutter/material.dart';
    
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? fromCity, toCity;
  DateTime? departureDate;


  Widget  dropDownFromCiy (String? cityField, String  fiealdText){
  return DropdownButtonFormField(
                
                value: cityField,
                validator: (value) {
                  if(value== null|| value.isEmpty){
                    return emptyFieldErrMessage;
                  }
                  return null; 
                },
                hint:  Text(fiealdText ),
                isExpanded: true,
                decoration: const InputDecoration(
                  errorStyle: TextStyle(color: Colors.white)
                ),
                items: cities.map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city)) ).toList(), 
                onChanged: (value){
                  setState(() {
                    cityField = value;
                  });

                });
}

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

                dropDownFromCiy(toCity, "To")
            ],

          ),
      ),
    ));
  }
}
