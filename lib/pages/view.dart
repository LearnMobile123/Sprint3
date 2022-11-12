import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewPag extends StatefulWidget {
  QueryDocumentSnapshot result;

  ViewPag(this.result,{Key? key}) : super(key: key);

  @override
  State<ViewPag> createState() => _ViewPagState();
}

class _ViewPagState extends State<ViewPag> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(widget.result["name"]),

                  ),
                const Image(
                  image: AssetImage('assets/images/destinos-turisticos.png'),
                ),
                const SizedBox(
                  height: 16.0,
                ),

                ListTile(
                  title: Text(widget.result["ciudad"]),

                  subtitle: Text(widget.result["descripcioón"]),



                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}