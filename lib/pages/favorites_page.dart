import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_app/Models/local_destino.dart';
import '../boxes.dart';


class FavoritesPage extends StatefulWidget {
  //QueryDocumentSnapshot result;


  FavoritesPage( {Key? key}) : super(key: key);



  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ValueListenableBuilder<Box<LocalDestino>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _) {
          final destinoBox = box.values.toList().cast<LocalDestino>();
          return ListView.builder(
            itemCount: destinoBox.length,
            itemBuilder: (BuildContext context, int index) {
              final destino = destinoBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    destino.urlimagen ?? "",
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Image(
                        image: AssetImage('assets/images/logo.png'),
                      );
                    },
                  ),
                  title: Text(destino.name ?? "No title"),
                  subtitle: Text(destino.descripcion ?? "No publishedDate"),
                  onLongPress: () {
                    setState(() {
                      destino.delete();
                    });
                  },
                ),
              );
            },
          );
        });
  }
}