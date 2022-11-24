import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/destino_lugares_page.dart';
import 'package:project_app/pages/favorites_page.dart';
import 'package:project_app/pages/mis_destinos_pag.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_app/pages/nuevo_destino_pag.dart';
import 'package:project_app/pages/register_page.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  late List<Widget> pages;

  @override
  void initState(){
    _loadPages();
        super.initState();
  }

  void _loadPages(){
     pages = [];
     pages.add(MisdestinosPag());
     pages.add(RegisterPage());
     pages.add(FavoritesPage());
     pages.add(DestinoLugaresPage());
  }

  void _onItemTapped(int page){
    setState(() {
     currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis destinos"),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item) {
              setState(() {
                if (item == Menu.logOut) {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.logOut,
                child: Text('Cerrar sesión'),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (page){
          _onItemTapped(page);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.placeOfWorship, size:20),
              label: 'Mis destinos'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cashRegister, size:20),
              label: 'Registrarse'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.heart, size:20),
              label: 'Mis Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.mapLocation, size:20),
              label: 'Mis lugares'),
        ],
      ),
    );
  }
}
