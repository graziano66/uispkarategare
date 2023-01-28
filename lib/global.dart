import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const drawerColor = Colors.green;
const drawerHoverColor = Colors.blueGrey;
const buttonColor = Colors.amber;

const defaultPadding = 16.0;

var dati = '';
int annoInUso = 0;
String annoInUsoStr = 'Selezionare un anno';

List<DataColumn> getColumns(List<String> browseCaption) {
  List<DataColumn> columns = [];
  columns.clear();
  columns.add(const DataColumn(label: Text('EDIT')));
  columns.add(const DataColumn(label: Text('DELETE')));
  for (String s in browseCaption) {
    columns.add(DataColumn(label: Text(s)));
  }
  return columns;
}

void showDBError(BuildContext context, String error) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('ERRORE SUL DATABASE'),
      content: Text(error),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

void showMessage(BuildContext context, String titolo, String res) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(titolo),
      content: Text(res),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Widget createEditText(String label, TextEditingController a) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: a,
//      validator: (value) {
//        if (value == null || value.isEmpty) {
//          return 'Please enter some text';
//        }
//        return null;
//      },
      decoration: InputDecoration(
//          border: const UnderlineInputBorder(), labelText: label),
          border: const OutlineInputBorder(),
          labelText: label),
    ),
  );
}

Widget createSizedEditText(
    String label, TextEditingController a, double larghezza) {
  return SizedBox(
      width: larghezza, height: 50, child: createEditText(label, a));
}

Widget createSizedEditLabel(String label, double larghezza) {
  return SizedBox(width: larghezza, child: Text(label));
}

Widget createEditDropDown(String label, TextEditingController a,
    List<DropdownMenuItem<String>> items) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButtonFormField<String>(
      value: a.text,
      icon: const Icon(Icons.arrow_downward),
      items: items,
      onChanged: (String? newValue) {
        a.text = newValue!;
      },
      decoration: InputDecoration(
//          border: const UnderlineInputBorder(), labelText: label),
          border: const OutlineInputBorder(),
          labelText: label),
    ),
  );
}

Widget createSizedEditDropDown(String label, TextEditingController a,
    List<DropdownMenuItem<String>> items, double larghezza) {
  return SizedBox(width: larghezza, child: createEditDropDown(label, a, items));
}

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < 1100 &&
    MediaQuery.of(context).size.width >= 650;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1100;
/*
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

   bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

   bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
*/
