import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';

class Categorie2Page extends StatefulWidget {
  const Categorie2Page({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Categorie2Page> createState() => _Categorie2PageState();
}

class _Categorie2PageState extends State<Categorie2Page> {
  @override
  void initState() {
    super.initState();
    getDataCategorie2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              showMessage(context, 'CATEGORIE', 'STAMPA');
            },
            icon: const Icon(
              Icons.print,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('Stampa'),
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: NavigationDrawer(),
              ),
            Expanded(
              flex: 5,
              child: DataTable2(
                columnSpacing: 10,
                columns: const <DataColumn>[
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('CATEGORIA'),
                  ),
                  DataColumn2(
                    fixedWidth: 300,
                    label: Text('DESCRIZIONE'),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('ANNI'),
                  ),
                  DataColumn2(
                    fixedWidth: 80,
                    label: Text('TIPO'),
                  ),
                  DataColumn2(
                    fixedWidth: 80,
                    label: Text('PESO'),
                  ),
                  DataColumn2(
                    fixedWidth: 150,
                    label: Text('CINTURA'),
                  ),
                  DataColumn2(
                    label: Text('SESSO'),
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
                      DataCell(Text(data[index]["IDCATEGORIA"].toString())),
                      DataCell(Text(data[index]["DESCRIZIONE"].toString())),
                      DataCell(Text(
                          '${data[index]["ANNO1"]}-${data[index]["ANNO2"]}')),
                      if (data[index]["KATA"].toString() == '1')
                        const DataCell(Text("KATA"))
                      else
                        const DataCell(Text("KUMITE")),
                      if (data[index]["KATA"].toString() == '1')
                        const DataCell(Text("-"))
                      else
                        DataCell(Text(
                            '${data[index]["PESOINIZIALE"]}-${data[index]["PESOFINALE"]}')),
                      if (data[index]["CINTURADA"] != data[index]["CINTURAA"])
                        DataCell(Text(
                            '${data[index]["CINTURADASTR"]}-${data[index]["CINTURAASTR"]}'))
                      else
                        DataCell(Text('${data[index]["CINTURADASTR"]}')),
                      DataCell(Text(data[index]["SESSO"].toString())),
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
