//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';

class CinturePage extends StatefulWidget {
  const CinturePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CinturePage> createState() => _CinturePageState();
}

class _CinturePageState extends State<CinturePage> {
  @override
  void initState() {
    super.initState();
    getDataCinture();
  }

  @override
  Widget build(BuildContext context) {
//    print('BUILD');
//    print(data);
//    print(numeroRighe);
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: BarraLaterale(),
              ),
            Expanded(
              flex: 5,
              child: DataTable2(
                columnSpacing: 10,
                columns: const <DataColumn>[
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('ID'),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('DESCRIZIONE'),
                  ),
                  DataColumn2(
                    label: Text('NOTE'),
                  ),
                ],
                rows: List<DataRow>.generate(
                  numeroRighe,
                  (int index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      // All rows will have the same selected color.
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      }
                      // Even rows will have a grey color.
                      if (index.isEven) {
                        return Colors.grey.withOpacity(0.3);
                      }
                      return null; // Use default value for other states and odd rows.
                    }),
                    cells: <DataCell>[
                      DataCell(Text(data[index]["ID"].toString())),
                      DataCell(Text(data[index]["DESCRIZIONE"].toString())),
                      DataCell(Text(data[index]["NOTE"].toString())),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
