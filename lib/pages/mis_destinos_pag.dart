import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/login_page.dart';
import 'package:project_app/pages/nuevo_destino_pag.dart';
import 'package:project_app/pages/view.dart';

class MisdestinosPag extends StatefulWidget {
  const MisdestinosPag({Key? key}) : super(key: key);

  @override
  State<MisdestinosPag> createState() => _MisdestinosPagState();
}

enum Menu { logOut }

class _MisdestinosPagState extends State<MisdestinosPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi destinos"),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .collection("destinos")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot destino = snapshot.data!.docs[index];
                return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPag(destino)));
                      },
                      title: Text(destino['name']),
                      subtitle: Text(destino['descripción']),
                    ));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NuevoDestinoPag()));
        },
        tooltip: 'Nuevo destino',
        child: const Icon(Icons.add),
      ),
    );
  }
}