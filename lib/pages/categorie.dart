//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:data_table_2/data_table_2.dart';
import 'package:uispkarategare/drawer.dart';
//import 'package:uispkarategare/constants.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';

class CategoriePage extends StatefulWidget {
  const CategoriePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CategoriePage> createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  @override
  void initState() {
    super.initState();
    getDataCategorie();
  }

  @override
  Widget build(BuildContext context) {
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

//              child: SingleChildScrollView(
//                padding: const EdgeInsets.all(defaultPadding),
              child: DataTable2(
                columnSpacing: 10,
                columns: const <DataColumn>[
//                  DataColumn(label: Text('')),
//                  DataColumn(label: Text('')),
//                  DataColumn(label: Text('')),
//            DataColumn(
//              label: Text('ID'),
//              numeric: true,
//            ),
//            DataColumn(
//              label: Text('IDSOCIO'),
//              numeric: true,
//            ),
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('ID'),
                  ),
                  DataColumn2(
                    fixedWidth: 250,
                    label: Text('DESCRIZIONE'),
//              numeric: true,
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('ANNO'),
//              numeric: true,
                  ),
                  DataColumn2(
                    label: Text('NOTE'),
//              numeric: true,
                  ),
                  //DataColumn( label: Text('COLORE'),   ),
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
//                      DataCell(
//                        IconButton(
//                            icon: const Icon(Icons.edit),
//                            color: Colors.black54,
//                            onPressed: () => {
//                                      edit(data[index]["id"].toString())
//                                }),
//                      ),
//                      DataCell(
//                        IconButton(
//                            icon: const Icon(Icons.delete),
//                            color: Colors.black54,
//                            onPressed: () => {
                      //                                    delete(data[index]["id"].toString(),
                      //                                        data[index]["descrizione"].toString())
//                                }),
//                      ),
//                      DataCell(
//                        IconButton(
//                            icon: const Icon(Icons.print),
//                            color: Colors.black54,
//                            onPressed: () => {
//                                      printrecord(data[index]["id"].toString())
//                                }),
//                      ),
//                DataCell(Text(data[index]["id"].toString())),
//                DataCell(Text(data[index]["idsocio"].toString())),
                      DataCell(Text(data[index]["ID"].toString())),
                      DataCell(Text(data[index]["DESCRIZIONE"].toString())),
                      DataCell(Text(data[index]["ANNO"].toString())),
                      DataCell(Text(data[index]["NOTE"].toString())),
                    ],
                  ),
                ),
              ),
            ),
//            ),
          ],
        ),
      ),
    );
  }
}
