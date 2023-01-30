import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/sql.dart';
import 'package:uispkarategare/pages/homepage.dart';
import 'package:uispkarategare/pages/cinture.dart';
import 'package:uispkarategare/pages/categorie.dart';
import 'package:uispkarategare/pages/categorie2.dart';
import 'package:uispkarategare/pages/gare.dart';

class BarraLaterale extends StatefulWidget {
  const BarraLaterale({Key? key}) : super(key: key);
  @override
  State<BarraLaterale> createState() => _BarraLateraleState();
}

class _BarraLateraleState extends State<BarraLaterale> {
  @override
  Widget build(BuildContext context) {
    var d = Drawer(
      child: Material(
        child: ListView(
          //padding: padding,
          children: [
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'UISP Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<int>(
                value: annoInUso,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                onChanged: (int? value) {
                  setState(() {
                    annoInUso = value!;
                    annoInUsoStr = 'SCEGLI REGOLAMENTO';
                    if (annoInUso == 1) annoInUsoStr = '22-23 Nazionale';
                    if (annoInUso == 2) annoInUsoStr = '22-23 Arcisate';
                  });
                },
                items: const [
                  DropdownMenuItem(value: 0, child: Text('SCEGLI REGOLAMENTO')),
                  DropdownMenuItem(value: 1, child: Text('22-23 Nazionale')),
                  DropdownMenuItem(value: 2, child: Text('22-23 Arcisate')),
                ],
              ),
            ),
            drawerMenuItem(
              text: 'REGOLAMENTI DISPONIBILI',
              icon: Icons.calendar_month,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Categorie',
              icon: Icons.list,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Cinture',
              icon: Icons.bookmark,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Gare',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
    return d;
  }
}

Widget drawerMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = drawerColor;
  const hoverColor = drawerHoverColor;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage(title: 'D.O. UISP - Gestione gare');
      }));
      break;
    case 1:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CategoriePage(
            title: 'D.O. UISP - Gestione gare - Anni disponibili');
      }));

      break;
    case 2:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return Categorie2Page(
            title: 'D.O. UISP - Gestione gare - Categorie $annoInUsoStr');
      }));
      break;
    case 3:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CinturePage(title: 'D.O. UISP - Gestione gare - Cinture');
      }));
      break;
    case 4:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const GarePage(title: 'D.O. UISP - Gestione gare');
      }));
      break;
  }
}
