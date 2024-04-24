import 'package:flutter/material.dart';

class SearchsBox extends StatefulWidget {
  final Function(String) onSubmit;
  const SearchsBox({super.key, required this.onSubmit});

  @override
  _SearchsBoxState createState() => _SearchsBoxState();
}

class _SearchsBoxState extends State<SearchsBox> {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {
          widget.onSubmit(_searchController.text);
        },
        keyboardType: TextInputType.phone,
        controller: _searchController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Search with Mobile',
          suffix: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if (_searchController.text.isEmpty) return;
                widget.onSubmit(_searchController.text);
              }),
        ),
      ),
    );
  }
}
