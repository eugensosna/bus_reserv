import 'package:bus_client/customswidgets/reservation_item_body_view.dart';
import 'package:bus_client/customswidgets/reservation_item_header_view.dart';
import 'package:bus_client/models/bus_reservation.dart';
import 'package:bus_client/models/reservation_expansion_item.dart';
import 'package:bus_client/providers/app_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  bool isFirst = true;
  List<ReservationExpansionItem> items = [];
  @override
  void didChangeDependencies() {
    if (isFirst) {
      _getData();
    }
    super.didChangeDependencies();
  }

  void _getData() async {
    final reservations =
        await Provider.of<AppDataProvider>(context, listen: false)
            .getAllReservation();
    items = Provider.of<AppDataProvider>(context, listen: false)
        .getExpansionItems(reservations);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  items[index].isExpanded = isExpanded;
                });
              },
              children: items
                  .map((e) => ExpansionPanel(
                      isExpanded: e.isExpanded,
                      headerBuilder: (context, isExpanded) =>
                          ReservationItemHeaderView(header: e.header),
                      body: ReservationItemBodyView(body: e.body)))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
