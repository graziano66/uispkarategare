import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:data_table_2/data_table_2.dart';
//import 'package:date_field/date_field.dart';

import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/pages/gare2.dart';

class GarePage extends StatefulWidget {
  const GarePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<GarePage> createState() => _GarePageState();
}

class _GarePageState extends State<GarePage> {
  late List data;
  var numeroRighe = 0;
  String fldId = '-1';
  TextEditingController fldData = TextEditingController(text: '');
  TextEditingController fldDescrizione = TextEditingController(text: '');
  TextEditingController fldNote = TextEditingController(text: '');

  getData() async {
    /*
    var s = Uri.parse('${httpcall}UISP_GARE?order=DATA&jwt=$jwt');
    http.Response res = await http.get(s);
    if (res.statusCode == 200) {
      Map dataMap2 = json.decode(res.body);
      data = dataMap2["records"];
      numeroRighe = data.length;
      setState(() {});
    } else {
      // ignore: use_build_context_synchronously
      showDBError(context, res);
    }
    */
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void garaInserimento() {
    fldId = '-1';
    fldData.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    fldDescrizione.text = '';
    fldNote.text = '';
    garaEdit('Inserimento Nuova Gara');
  }

  void garaModifica(String id) async {
    /*
//    print('modifica ingresso id=$id');
    fldId = id;
    var s = Uri.parse('${httpcall}UISP_GARE/$id?jwt=$jwt');
//    print(s);
    http.Response res = await http.get(s);
    if (res.statusCode == 200) {
//      print(res.body);
      Map data = json.decode(res.body);
//      data = dataMap2["records"];
//      fldId = data[0]['ID'].toString();
      fldSocieta.text = data['IDSOCIETA'].toString();
      fldData.text = data['DATA'].toString();
      fldDescrizione.text = data['DESCRIZIONE'].toString();
      fldNote.text = data['NOTE'].toString();
      garaEdit('Modifica Gara');
    } else {
      // ignore: use_build_context_synchronously
      showDBError(context, res);
    }
    */
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
//              TextFormField(
//                controller: fldData,
//                decoration: const InputDecoration(
//                  border: UnderlineInputBorder(),
//                  labelText: 'DATA GARA',
//                ),
//              ),
              const SizedBox(height: 12.0),
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
              saveData();
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

  void saveData() async {
    /*
//    print('savedata');
    Map<String, String> saveData = {};

    saveData['ID'] = fldId;
    saveData['DATA'] = fldData.text;
    saveData['DESCRIZIONE'] = fldDescrizione.text;
    saveData['NOTE'] = fldNote.text;
//    saveData['jwt'] = jwt;
    http.Response res;
//    var s = Uri.parse('${httpcall}UISP_GARE?jwt=$jwt');
//    print(s);
    saveData.remove('ID'); // ALTRIMENTI USA -1
    if (fldId == '-1') {
      // INSERT NEW RECORD
//      print('insert');
      saveData.remove('ID'); // ALTRIMENTI USA -1
      var s = Uri.parse('${httpcall}UISP_GARE?jwt=$jwt');
      res = await http.post(s, body: json.encode(saveData));
    } else {
      // SAVE CHANGE TO RECORD
//      print('edit');
//      print(json.encode(saveData));
      var s = Uri.parse('${httpcall}UISP_GARE/$fldId?jwt=$jwt');
      saveData.remove('ID'); // ALTRIMENTI USA -1
      res = await http.put(s, body: json.encode(saveData));
    }
    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'OK');
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const GarePage(title: 'D.O. UISP - Gestione gare');
      }));
    } else {
      // ignore: use_build_context_synchronously
      showDBError(context, res);
    }
    */
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
                    fixedWidth: 150,
                    label: Text('IDSOCIETA'),
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
                                  garaModifica(data[index]["ID"].toString())
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
                      DataCell(Text(data[index]["IDSOCIETA"].toString())),
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
