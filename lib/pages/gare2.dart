import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/sql.dart';
import 'package:uispkarategare/pages/gare3.dart';

class Gare2Page extends StatefulWidget {
  const Gare2Page({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Gare2Page> createState() => _Gare2PageState();
}

class _Gare2PageState extends State<Gare2Page> {
  String fldId = '-1';
  TextEditingController fld = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getDataCintureList();
    getDataGare2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () async {
              // INSERIRE I DATI IN CSV
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['csv'],
              );
//              print('FILE PICKER ');
              if (result != null) {
//                print('INIZIO INSERIMENTO');
                String errore = '';
                int numeroErrori = 0;
                final input = File(result.files.single.path!).openRead();
                final fields = await input
                    .transform(utf8.decoder)
                    .transform(const CsvToListConverter())
                    .toList();
// CONTROLLO ERRORI
                for (var f in fields) {
                  if ((f[5].toString().toUpperCase() != 'M') &&
                      (f[5].toString().toUpperCase() != 'F')) {
                    errore =
                        'Cognome:${f[3].toString().toUpperCase()} Nome:${f[4].toString().toUpperCase()} Campo Sesso errato';
                    showMessage(context, 'ERRORE', errore);
                    numeroErrori += 1;
                  }
                  int idCintura = -1;
                  for (var c in dataCinture) {
                    if (c['DESCRIZIONE'].toString().toUpperCase() ==
                        f[6].toString().toUpperCase()) {
                      idCintura = c['ID'];
                    }
                  }
                  if (idCintura == -1) {
                    errore =
                        'Cognome:${f[3].toString().toUpperCase()} Nome:${f[4].toString().toUpperCase()} Campo Cintura errato';
                    showMessage(context, 'ERRORE', errore);
                    numeroErrori += 1;
                  }
                }
// INSERISCO SE CSV SENZA ERRORI
                if (numeroErrori == 0) {
                  for (var f in fields) {
                    Map<String, String> saveData = {};
                    saveData['IDGARA'] = idGaraSelezionata.toString();
                    saveData['CFSOCIETA'] = f[0].toString().toUpperCase();
                    saveData['SOCIETA'] = f[1].toString().toUpperCase();
                    saveData['SOCIETA2'] = f[2].toString().toUpperCase();
                    saveData['COGNOME'] = f[3].toString().toUpperCase();
                    saveData['NOME'] = f[4].toString().toUpperCase();
                    saveData['SESSO'] = f[5].toString().toUpperCase();
                    saveData['CINTURA'] = f[6].toString().toUpperCase();
                    int idCintura = -1;
                    for (var c in dataCinture) {
                      if (c['DESCRIZIONE'].toString().toUpperCase() ==
                          f[6].toString().toUpperCase()) {
                        idCintura = c['ID'];
                      }
                    }
                    saveData['IDCINTURA'] = idCintura.toString();
                    saveData['ANNO'] = f[7].toString().toUpperCase();
                    saveData['KATA'] = f[8].toString().toUpperCase();
                    saveData['KUMITE'] = f[9].toString().toUpperCase();
                    saveData['PESO'] = f[10].toString().toUpperCase();
                    saveData['CF'] = f[11].toString().toUpperCase();
                    saveData['NRTESSERA'] = f[12].toString().toUpperCase();
                    saveData['NOTE'] = '';
//                      print('========');
//                    print(saveData);
                    gare2add(saveData);
                  }
                }
              } else {
                // User canceled the picker
              }
              setState(() {
                getDataGare2();
              });
            },
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('INSERIMENTO DATI CSV'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return Gare3Page(title: widget.title);
              }));
            },
            icon: const Icon(
              Icons.arrow_circle_right,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('VAI A ELABORAZIONE CATEGORIE'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showMessage(context, 'GARE DETTAGLIO', 'STAMPA');
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
            label: const Text('Stampa elenco'),
          ),
        ],
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
//                  DataColumn2(fixedWidth: 40, label: Text('')),
//                  DataColumn2(fixedWidth: 40, label: Text('')),
//                  DataColumn2(fixedWidth: 40, label: Text('')),
//                  DataColumn2(fixedWidth: 50, label: Text('ID')),
//                  DataColumn2(fixedWidth: 50, label: Text('IDGARA')),
//                  DataColumn2(fixedWidth: 100, label: Text('CFSOCIETA')),
                  DataColumn2(fixedWidth: 150, label: Text('SOCIETA')),
                  DataColumn2(fixedWidth: 150, label: Text('SOCIETA2')),
                  DataColumn2(fixedWidth: 150, label: Text('COGNOME')),
                  DataColumn2(fixedWidth: 150, label: Text('NOME')),
                  DataColumn2(fixedWidth: 100, label: Text('SESSO')),
                  DataColumn2(fixedWidth: 100, label: Text('CINTURA')),
//                  DataColumn2(fixedWidth: 50, label: Text('IDCINTURA')),
                  DataColumn2(fixedWidth: 50, label: Text('ANNO')),
                  DataColumn2(fixedWidth: 50, label: Text('KATA')),
                  DataColumn2(fixedWidth: 50, label: Text('KUMITE')),
                  DataColumn2(label: Text('PESO')),
//                  DataColumn2(fixedWidth: 100, label: Text('CF')),
//                  DataColumn2(fixedWidth: 100, label: Text('NRTESSERA')),
//                  DataColumn2(label: Text('NOTE')),
                ],
                rows: List<DataRow2>.generate(
                  numeroRighe,
                  (int index) => DataRow2(
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
//                            icon: const Icon(Icons.delete),
//                            color: Colors.red,
//                            onPressed: () => {
//                                  print('delete id=${data[index]["ID"]}')
//                                }),
//                      ),
//                      DataCell(
//                        IconButton(
//                            icon: const Icon(Icons.edit),
//                            color: Colors.green,
//                            onPressed: () => {
//                                  print('edit id=${data[index]["ID"]}'),
//                                  gara2Modifica(data[index]["ID"].toString())
//                                }),
//                      ),
//                      DataCell(
//                        IconButton(
//                            icon: const Icon(Icons.list),
//                            color: Colors.green,
//                            onPressed: () => {
//                                  print('Details ${data[index]["ID"]}')
//                                }),
//                      ),
//                      DataCell(Text(data[index]["ID"].toString())),
//                      DataCell(Text(data[index]["IDGARA"].toString())),
//                      DataCell(Text(data[index]["CFSOCIETA"].toString())),
                      DataCell(Text(data[index]["SOCIETA"].toString())),
                      DataCell(Text(data[index]["SOCIETA2"].toString())),
                      DataCell(Text(data[index]["COGNOME"].toString())),
                      DataCell(Text(data[index]["NOME"].toString())),
                      DataCell(Text(data[index]["SESSO"].toString())),
                      DataCell(Text(data[index]["CINTURA"].toString())),
//                      DataCell(Text(data[index]["IDCINTURA"].toString())),
                      DataCell(Text(data[index]["ANNO"].toString())),
                      DataCell(Text(data[index]["KATA"].toString())),
                      DataCell(Text(data[index]["KUMITE"].toString())),
                      DataCell(Text(data[index]["PESO"].toString())),
//                      DataCell(Text(data[index]["CF"].toString())),
//                      DataCell(Text(data[index]["NRTESSERA"].toString())),
//                      DataCell(Text(data[index]["NOTE"].toString())),
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
