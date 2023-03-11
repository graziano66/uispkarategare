import 'package:flutter/material.dart';
import 'package:uispkarategare/global.dart';
import 'package:uispkarategare/pages/homepage.dart';
import 'package:uispkarategare/pages/cinture.dart';
import 'package:uispkarategare/pages/cat_kata.dart';
import 'package:uispkarategare/pages/cat_kumite.dart';
import 'package:uispkarategare/pages/iscritti.dart';
import 'package:uispkarategare/pages/kata.dart';
import 'package:uispkarategare/pages/kumite.dart';
import 'package:uispkarategare/print/prkatatabellonevuoto.dart';

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
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Cinture',
              icon: Icons.bookmark,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Cat. Kata',
              icon: Icons.list,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Cat. Kumite',
              icon: Icons.list,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Iscritti',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 4),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Kata',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Kumite',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 6),
            ),
            const SizedBox(
              height: 8,
            ),
            drawerMenuItem(
              text: 'Stampa Kata Vuoto',
              icon: Icons.group,
              onClicked: () => selectedItem(context, 7),
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
        return const CinturePage(title: 'D.O. UISP - Gestione gare - Cinture');
      }));
      break;
    case 2:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CategorieKataPage(
            title: 'D.O. UISP - Gestione gare - Categorie KATA');
      }));
      break;
    case 3:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const CategorieKumitePage(
            title: 'D.O. UISP - Gestione gare - Categorie KUMITE');
      }));
      break;
    case 4:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const IscrittiPage(
            title: 'D.O. UISP - Gestione gare - Elenco Iscritti');
      }));
      break;
    case 5:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const KataPage(
            title: 'D.O. UISP - Gestione gare - Tabelloni KATA');
      }));
      break;
    case 6:
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
        return const KumitePage(
            title: 'D.O. UISP - Gestione gare - Tabelloni KUMITE');
      }));
      break;
    case 7:
      PrKataTabelloneVuoto stampa = PrKataTabelloneVuoto();
      stampa.stampa();

      break;
  }
}
