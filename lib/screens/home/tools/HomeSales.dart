import 'package:flutter/material.dart';

class HomeSales extends StatefulWidget {
  const HomeSales({Key? key}) : super(key: key);

  @override
  State<HomeSales> createState() => _HomeSalesState();
}

class _HomeSalesState extends State<HomeSales> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: DataTable(
          border: TableBorder.all(
              color: Colors.red.shade900,
              width: 3,
              borderRadius:
              BorderRadius.all(Radius.elliptical(30, 20)),
              style: BorderStyle.none),
          columns: [
            DataColumn(label: Text('Black')),
            DataColumn(label: Text('Red')),
            DataColumn(label: Text('Yellow')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Yes')),
              DataCell(Text('No')),
              DataCell(Text('yes')),
            ]),
            DataRow(cells: [
              DataCell(Text('No')),
              DataCell(Text('Yes')),
              DataCell(Text('No')),
            ]),
            DataRow(cells: [
              DataCell(Icon(Icons.check)),
              DataCell(Icon(Icons.check)),
              DataCell(Icon(Icons.check)),
            ])
          ],
        ),
      ),
    );
  }
}
