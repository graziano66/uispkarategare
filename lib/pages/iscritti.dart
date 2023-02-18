import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/database/sql.dart';

class IscrittiPage extends StatefulWidget {
  const IscrittiPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<IscrittiPage> createState() => _IscrittiPageState();
}

class _IscrittiPageState extends State<IscrittiPage> {
  String fldId = '-1';
  TextEditingController fld = TextEditingController(text: '');
  TextEditingController fldOk = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getDataCintureList();
    getDataIscritti();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BarraLaterale(),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () {
              cancellazioneIscritti();
            },
            icon: const Icon(
              Icons.remove,
              size: 24.0,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              //foregroundColor: Colors.black,
              elevation: 0,
            ),
            label: const Text('CANCELLA ELENCO'),
          ),
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
                    // ignore: use_build_context_synchronously
                    showMessage(context, 'ERRORE', errore);
                    numeroErrori += 1;
                  }
                  int idCintura = -1;
                  for (var c in dataCinture) {
                    if (c['DESCRIZIONE'].toString().toUpperCase() ==
                        f[6].toString().toUpperCase()) {
                      idCintura = c['ID'];
                    }
                    if (c['NOTE'].toString().toUpperCase() ==
                        f[6].toString().toUpperCase()) {
                      idCintura = c['ID'];
                    }
                  }
                  if (idCintura == -1) {
                    errore =
                        'Cognome:${f[3].toString().toUpperCase()} Nome:${f[4].toString().toUpperCase()} Campo Cintura errato';
                    // ignore: use_build_context_synchronously
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
                      if (c['NOTE'].toString().toUpperCase() ==
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
                    iscrittiAdd(saveData);
                  }
                }
              } else {
                // User canceled the picker
              }
              setState(() {
                getDataIscritti();
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
                  DataColumn2(fixedWidth: 150, label: Text('SOCIETA')),
                  DataColumn2(fixedWidth: 150, label: Text('CITTA')),
                  DataColumn2(fixedWidth: 150, label: Text('COGNOME')),
                  DataColumn2(fixedWidth: 150, label: Text('NOME')),
                  DataColumn2(fixedWidth: 100, label: Text('SESSO')),
                  DataColumn2(fixedWidth: 100, label: Text('CINTURA')),
                  DataColumn2(fixedWidth: 50, label: Text('ANNO')),
                  DataColumn2(fixedWidth: 50, label: Text('KATA')),
                  DataColumn2(fixedWidth: 50, label: Text('KUMITE')),
                  DataColumn2(label: Text('PESO')),
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
                      DataCell(Text(data[index]["SOCIETA"].toString())),
                      DataCell(Text(data[index]["SOCIETA2"].toString())),
                      DataCell(Text(data[index]["COGNOME"].toString())),
                      DataCell(Text(data[index]["NOME"].toString())),
                      DataCell(Text(data[index]["SESSO"].toString())),
                      DataCell(Text(data[index]["CINTURA"].toString())),
                      DataCell(Text(data[index]["ANNO"].toString())),
                      DataCell(Text(data[index]["KATA"].toString())),
                      DataCell(Text(data[index]["KUMITE"].toString())),
                      DataCell(Text(data[index]["PESO"].toString())),
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

  void cancellazioneIscritti() {
    fldOk.text = 'NO';
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('ATTENZIONE'),
        content: SizedBox(
          width: 300,
          height: 200,
          child: Column(
            children: [
              const Text(
                  'PER CANCELLARE I DATI SCRIVI SI IN MAIUSCOLO E CONFERMA COL PULSANTE'),
              const SizedBox(height: 40.0),
              TextFormField(
                controller: fldOk,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CONFERMA',
                ),
              ),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              if (fldOk.text == 'SI') eseguiSql('DELETE FROM ISCRITTI');
              setState(() {
                getDataIscritti();
              });
              Navigator.pop(context, 'OK');
            },
            child: const Text('CONFERMA CANCELLAZIONE'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'ANNULLA'),
            child: const Text('ANNULLA'),
          ),
        ],
      ),
    );
  }
}
