import 'dart:io';
//import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:uispkarategare/drawer.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/database/sql.dart';
import 'package:uispkarategare/database/load_kata.dart';
import 'package:uispkarategare/database/load_kumite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController fldData = TextEditingController(text: '');
  TextEditingController fldDescrizione = TextEditingController(text: '');
  TextEditingController fldCitta = TextEditingController(text: '');
  TextEditingController fldNote = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getDataGare();
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                  onPressed: () {
                                    garaEdit();
                                  },
                                  child: const Text('MODIFICA  GARA')),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data[0]['DATA']}'),
                              Text('${data[0]['DESCRIZIONE']}'),
                              Text('${data[0]['CITTA']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.lightBlue,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                  onPressed: () {
                                    caricaRegoleKata();
                                  },
                                  child: const Text('CARICA REGOLE KATA')),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data[0]['KATA']}'),
//                              Text('${data[0]['KATA2']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.lightBlueAccent,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                  onPressed: () {
                                    caricaRegoleKumite();
                                  },
                                  child: const Text('CARICA REGOLE KUMITE')),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${data[0]['KUMITE']}'),
//                              Text('${data[0]['KUMITE2']}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: FileImage(File('logo2.png')),
                              width: 200,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('LOGO SINISTRA')),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: FileImage(File('logo1.png')),
                              width: 200,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('LOGO CENTRALE')),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: FileImage(File('logo3.png')),
                              width: 200,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('LOGO DESTRA')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void garaEdit() {
    fldData.text = data[0]['DATA'];
    fldDescrizione.text = data[0]['DESCRIZIONE'];
    fldCitta.text = data[0]['CITTA'];
    fldNote.text = data[0]['NOTE'];

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('MODIFICA GARA'),
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
                controller: fldCitta,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CITTA',
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
              dataEdit.add([
                fldData.text,
                fldDescrizione.text,
                fldCitta.text,
                fldNote.text
              ]);
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

  caricaRegoleKata() async {
    FilePickerResult? f = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (f != null) {
      // ignore: use_build_context_synchronously
      await caricaRegoleKataDaCSV(f, context);
    }
    setState(() {
      getDataGare();
    });
  }

  caricaRegoleKumite() async {
    FilePickerResult? f = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (f != null) {
      // ignore: use_build_context_synchronously
      await caricaRegoleKumiteDaCSV(f, context);
    }
    setState(() {
      getDataGare();
    });
  }
}
