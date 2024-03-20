import 'package:flutter/material.dart';
    
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('qqq'),
      ),
      body: Form(
        child: Center(
          child: ListView(
            padding: const EdgeInsets.all(8) ,
          ),
      ),
    ));
  }
}