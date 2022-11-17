import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_app/pages/login_page.dart';

class ViewPag extends StatefulWidget {
  QueryDocumentSnapshot result;

  ViewPag(this.result, {Key? key}) : super(key: key);

  @override
  State<ViewPag> createState() => _ViewPagState();
}

enum Menu { logOut }


class _ViewPagState extends State<ViewPag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text('Detalles sitio turistico'),
        actions: [
          PopupMenuButton(
            onSelected: (Menu item) {
              setState(() {
                if (item == Menu.logOut) {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Opocion para centrar verticalmente
                  children: <Widget>[
                    const SizedBox(
                      width: 8.0,
                    ),

                    Text(
                        widget.result["name"],
                      style: const TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),


                const SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text(widget.result["genre"]),

                ),
                Image.network(widget.result["urlimagen"]),
                const SizedBox(
                  height: 16.0,
                ),
                ListTile(
                  title: Text(widget.result["ciudad"]),
                  subtitle: Text(widget.result["departamento"]),
                ),
                ListTile(
                  title: Text(widget.result["temperatura"]),
                  subtitle: Text(widget.result["descripción"]),
                ),

                ListTile(
                  title: Text("Calificacion"),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                RatingBar.builder(
                  initialRating: widget.result["rating"],
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
