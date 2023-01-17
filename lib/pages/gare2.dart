import 'dart:convert';
import 'dart:io';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:data_table_2/data_table_2.dart';
//import 'package:date_field/date_field.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
//import 'package:uispdogare/drawer.dart';
import 'package:uispkarategare/global.dart';

class Gare2Page extends StatefulWidget {
  const Gare2Page({Key? key, required this.title, required this.idGara})
      : super(key: key);
  final String title;
  final String idGara;
  @override
  State<Gare2Page> createState() => _Gare2PageState();
}

class _Gare2PageState extends State<Gare2Page> {
  late List data;
  late List dataCinture;
  List<String> errori = [];
  var numeroRighe = 0;
  var numeroRigheCinture = 0;
  String fldId = '-1';
  TextEditingController fld = TextEditingController(text: '');

  getDataCinture() async {
    /*
    var s = Uri.parse('${httpcall}UISP_CINTURE?order=id&jwt=$jwt');
    http.Response res = await http.get(s);
    if (res.statusCode == 200) {
      Map dataMap2 = json.decode(res.body);
      dataCinture = dataMap2["records"];
      numeroRigheCinture = data.length;
      setState(() {});
    } else {
      // ignore: use_build_context_synchronously
      showDBError(context, res);
    }
    */
  }

  getData() async {
    /*
    var s = Uri.parse(
        '${httpcall}UISP_GARE2?filter=IDGARA,eq,${widget.idGara}&jwt=$jwt');
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
    getDataCinture();
    getData();
  }

  void gara2Inserimento() {
    fldId = '-1';
    fld.text = '';
    gara2Edit('Inserimento Nuova Gara2');
  }

  void gara2Modifica(String id) async {
    /*
    fldId = id;
    var s = Uri.parse('${httpcall}UISP_GARE2/$id?jwt=$jwt');
//    print(s);
    http.Response res = await http.get(s);
    if (res.statusCode == 200) {
//      print(res.body);
      Map data = json.decode(res.body);
//      data = dataMap2["records"];
//      fldId = data[0]['ID'].toString();
      fld.text = data[''].toString();
      gara2Edit('Modifica Gara2');
    } else {
      // ignore: use_build_context_synchronously
      showDBError(context, res);
    }
    */
  }

  void gara2Edit(String titolo) {
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
                controller: fld,
                decoration: const InputDecoration(
//                  border: UnderlineInputBorder(),
                  border: OutlineInputBorder(),
//        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  labelText: 'SOCIETA',
                ),
              ),
//              TextFormField(
//                controller: fldData,
//                decoration: const InputDecoration(
//                  border: UnderlineInputBorder(),
//                  labelText: 'DATA GARA',
//                ),
//              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: fld,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),

//                  border: UnderlineInputBorder(),
                  labelText: 'DESCRIZIONE',
                ),
              ),
              const SizedBox(height: 12.0),

              TextFormField(
                controller: fld,
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
    saveData[''] = fld.text;
    http.Response res;
    saveData.remove('ID');
    if (fldId == '-1') {
      // INSERT NEW RECORD
//      print('insert');
      saveData.remove('ID'); // ALTRIMENTI USA -1
      var s = Uri.parse('${httpcall}UISP_GARE2?jwt=$jwt');
      res = await http.post(s, body: json.encode(saveData));
    } else {
      // SAVE CHANGE TO RECORD
//      print('edit');
//      print(json.encode(saveData));
      var s = Uri.parse('${httpcall}UISP_GARE2/$fldId?jwt=$jwt');
      saveData.remove('ID'); // ALTRIMENTI USA -1
      res = await http.put(s, body: json.encode(saveData));
    }
    if (res.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 'OK');
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const Gare2Page(
          title: 'D.O. UISP - Gestione gare',
          idGara: '1',
        );
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
//      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: Text(widget.idGara + widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
            onPressed: () async {
              // INSERIRE I DATI IN CSV
//              print('fff');
//              FilePickerResult? result = await FilePicker.platform.pickFiles();
//              print('OK');
              var result = 0;
              if (result != null) {
//                print('Result');
//                File file = File(result.files.single.path!);
//                final contents = await file.readAsString();

//                final input = File(result.files.single.path!).openRead();
                final input = File('').openRead();
                final fields = await input
                    .transform(utf8.decoder)
                    .transform(const CsvToListConverter())
                    .toList();
                for (var f in fields) {
                  Map<String, String> saveData = {};
                  saveData['IDGARA'] = widget.idGara.toString().toUpperCase();
                  saveData['CFSOCIETA'] = f[0].toString().toUpperCase();
                  saveData['SOCIETA'] = f[1].toString().toUpperCase();
                  saveData['SOCIETA2'] = f[2].toString().toUpperCase();
                  saveData['COGNOME'] = f[3].toString().toUpperCase();
                  saveData['NOME'] = f[4].toString().toUpperCase();
                  saveData['SESSO'] = f[5].toString().toUpperCase();
                  if ((saveData['SESSO'] != 'M') ||
                      (saveData['SESSO'] != 'F')) {
                    errori.add(
                        '${saveData['COGNOME']} ${saveData['NOME']} Sesso M o F');
                  }
                  saveData['CINTURA'] = f[6].toString().toUpperCase();
                  int idCintura = -1;
//                  print('CINTURE');
//                  print(dataCinture);
                  for (var c in dataCinture) {
//                    print('C ${c['DESCRIZIONE'].toString().toUpperCase()}');
//                    print('F ${f[6].toString().toUpperCase()}');
                    if (c['DESCRIZIONE'].toString().toUpperCase() ==
                        f[6].toString().toUpperCase()) {
//                      print('ok');
                      idCintura = c['ID'];
                    }
                  }
                  if (idCintura == -1) {
                    errori.add(
                        '${saveData['COGNOME']} ${saveData['NOME']} Cintura errata');
                  }

                  saveData['IDCINTURA'] = idCintura.toString();
                  saveData['ANNO'] = f[7].toString().toUpperCase();
                  saveData['KATA'] = f[8].toString().toUpperCase();
                  saveData['KUMITE'] = f[9].toString().toUpperCase();
                  saveData['PESO'] = f[10].toString().toUpperCase();
                  saveData['CF'] = f[11].toString().toUpperCase();
                  saveData['NRTESSERA'] = f[12].toString().toUpperCase();
                  saveData['NOTE'] = '';
//                  http.Response res;
                  //                var s = Uri.parse('${httpcall}UISP_GARE2?jwt=$jwt');
                  //                 res = await http.post(s, body: json.encode(saveData));
                  //                 if (res.statusCode == 200) {
//                    print(saveData);
//                  } else {
                  // ignore: use_build_context_synchronously
                  //                  showDBError(context, res);
                  //               }
                }
              } else {
                // User canceled the picker
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
            label: const Text('INSERIMENTO DATI CSV'),
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
            label: const Text('Stampa'),
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
//            if (isDesktop(context))
//              const Expanded(
            // flex: 1, (default)
//                child: NavigationDrawer(),
//              ),
            Expanded(
              flex: 5,
              child: DataTable2(
                columnSpacing: 10,
                columns: const <DataColumn>[
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(fixedWidth: 50, label: Text('')),
                  DataColumn2(fixedWidth: 50, label: Text('ID')),
                  DataColumn2(fixedWidth: 50, label: Text('IDGARA')),
                  DataColumn2(fixedWidth: 50, label: Text('CFSOCIETA')),
                  DataColumn2(fixedWidth: 50, label: Text('SOCIETA')),
                  DataColumn2(fixedWidth: 50, label: Text('SOCIETA2')),
                  DataColumn2(fixedWidth: 50, label: Text('COGNOME')),
                  DataColumn2(fixedWidth: 50, label: Text('NOME')),
                  DataColumn2(fixedWidth: 50, label: Text('SESSO')),
                  DataColumn2(fixedWidth: 50, label: Text('CINTURA')),
                  DataColumn2(fixedWidth: 50, label: Text('IDCINTURA')),
                  DataColumn2(fixedWidth: 50, label: Text('ANNO')),
                  DataColumn2(fixedWidth: 50, label: Text('KATA')),
                  DataColumn2(fixedWidth: 50, label: Text('KUMITE')),
                  DataColumn2(fixedWidth: 50, label: Text('PESO')),
                  DataColumn2(fixedWidth: 50, label: Text('CF')),
                  DataColumn2(fixedWidth: 50, label: Text('NRTESSERA')),
                  DataColumn2(label: Text('NOTE')),
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
                                  gara2Modifica(data[index]["ID"].toString())
                                }),
                      ),
                      DataCell(
                        IconButton(
                            icon: const Icon(Icons.list),
                            color: Colors.green,
                            onPressed: () => {
//                                  print('Details ${data[index]["ID"]}')
                                }),
                      ),
                      DataCell(Text(data[index]["ID"].toString())),
                      DataCell(Text(data[index]["IDGARA"].toString())),
                      DataCell(Text(data[index]["CFSOCIETA"].toString())),
                      DataCell(Text(data[index]["SOCIETA"].toString())),
                      DataCell(Text(data[index]["SOCIETA2"].toString())),
                      DataCell(Text(data[index]["COGNOME"].toString())),
                      DataCell(Text(data[index]["NOME"].toString())),
                      DataCell(Text(data[index]["SESSO"].toString())),
                      DataCell(Text(data[index]["CINTURA"].toString())),
                      DataCell(Text(data[index]["IDCINTURA"].toString())),
                      DataCell(Text(data[index]["ANNO"].toString())),
                      DataCell(Text(data[index]["KATA"].toString())),
                      DataCell(Text(data[index]["KUMITE"].toString())),
                      DataCell(Text(data[index]["PESO"].toString())),
                      DataCell(Text(data[index]["CF"].toString())),
                      DataCell(Text(data[index]["NRTESSERA"].toString())),
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
