//import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';
import 'package:uispkarategare/pages/gare2.dart';

class GarePage extends StatefulWidget {
  const GarePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<GarePage> createState() => _GarePageState();
}

class _GarePageState extends State<GarePage> {
  int fldId = -1;
  TextEditingController fldData = TextEditingController(text: '');
  TextEditingController fldDescrizione = TextEditingController(text: '');
  TextEditingController fldNote = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getDataGare();
  }

  void garaInserimento() {
    fldId = -1;
    fldData.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    fldDescrizione.text = '';
    fldNote.text = '';
    garaEdit('Inserimento Nuova Gara');
  }

  void garaModifica(int id) async {
    getDataGareId(id);
    if (numeroRigheEdit != 1) {
      showMessage(context, 'DATABASE ERROR',
          'DATO NON TROVATO NEL DATABASE ERRNO=$numeroRigheEdit');
    } else {
      fldId = id;
      fldData.text = dataEdit[0]['DATA'].toString();
      fldDescrizione.text = dataEdit[0]['DESCRIZIONE'].toString();
      fldNote.text = dataEdit[0]['NOTE'].toString();
      garaEdit('Modifica Gara');
    }
  }

  void garaEdit(String titolo) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(titolo),
        content: SizedBox(
          width: 600,
          height: 300,
          child: Column(
            children: [
              TextFormField(
                controller: fldData, //editing controller of this TextField
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "DATA", //label text of field
                  border: OutlineInputBorder(),
                ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.parse(fldData.text),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
//                    print(pickedDate);
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
//                    print(formattedDate);
                    setState(() {
                      fldData.text = formattedDate;
                    });
                  } else {
//                    print("Date is not selected");
                  }
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: fldDescrizione,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

//                  border: UnderlineInputBorder(),
                  labelText: 'DESCRIZIONE',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: fldNote,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NOTE',
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              dataEdit.clear();
              dataEdit.add(
                  [fldId, fldData.text, fldDescrizione.text, fldNote.text]);
              saveDataGare();
              setState(() {
                getDataGare();
              });
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'ANNULLA'),
            child: const Text('ANNULLA'),
          ),
        ],
      ),
    );
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
              if (annoInUso == -1) {
                showMessage(context, 'GARE',
                    'DEVI SELEZIONARE UN ANNO PRIMA DI INSERIRE UNA GARA');
              } else {
                garaInserimento();
              }
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
            label: const Text('NUOVA GARA'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              showMessage(context, 'GARE', 'STAMPA');
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
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(
                    fixedWidth: 50,
                    label: Text('ID'),
                  ),
                  DataColumn2(
                    fixedWidth: 100,
                    label: Text('DATA'),
                  ),
                  DataColumn2(
                    fixedWidth: 300,
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
                      DataCell(
                        IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () => {
//                                  print('delete id=${data[index]["ID"]}')
                                }),
                      ),
                      DataCell(
                        IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.green,
                            onPressed: () => {
//                                  print('edit id=${data[index]["ID"]}'),
                                  garaModifica(data[index]["ID"])
                                }),
                      ),
                      DataCell(IconButton(
                        icon: const Icon(Icons.list),
                        color: Colors.green,
                        onPressed: () {
//                          print('Details ${data[index]["ID"]}');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Gare2Page(
                                idGara: data[index]["ID"].toString(),
                                title:
                                    'D.O. UISP - Gara Del ${data[index]["DATA"]} - ${data[index]["DESCRIZIONE"]}');
                          }));
                        },
                      )),
                      DataCell(Text(data[index]["ID"].toString())),
                      DataCell(Text(data[index]["DATA"].toString())),
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
