import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_app/repository/firebase_api.dart';
import 'package:project_app/Models/destino.dart';

class NuevoDestinoPag extends StatefulWidget {
  const NuevoDestinoPag({Key? key}) : super(key: key);

  @override
  State<NuevoDestinoPag> createState() => _NuevoDestinoPagState();
}

class _NuevoDestinoPagState extends State<NuevoDestinoPag> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _ciudad = TextEditingController();
  final _departamento = TextEditingController();
  final _temperatura = TextEditingController();
  final _descripcion = TextEditingController();
  final _urlimagen = TextEditingController();

  double _rating = 3.0;

  bool _escalada = false,
      _aventura = false,
      _cruceros = false,
      _recreacion = false;
  bool _senderismo = false, _trekking = false, _peregrinacion = false, _playa = false;

  void _showMsg(String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _createDestino(Destino destino) async{
    var result = await _firebaseApi.createDestino(destino);
    _showMsg(result);
    Navigator.pop(context);
  }

  void _saveDestino() {
    var genres = "";
    if (_escalada) genres = "$genres Escalada";
    if (_aventura) genres = "$genres Aventura";
    if (_cruceros) genres = "$genres Cruceros";
    if (_recreacion) genres = "$genres Recreación";
    if (_senderismo) genres = "$genres Senderismo";
    if (_trekking) genres = "$genres Trekking";
    if (_peregrinacion) genres = "$genres Peregrinación";
    if (_playa) genres = "$genres Playa";
    var destino= Destino("", _name.text, _ciudad.text, _departamento.text, _temperatura.text, _descripcion.text, _rating, genres, _urlimagen.text);
    _createDestino(destino);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Destino"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nombre'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _ciudad,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Ciudad'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _departamento,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Departamento'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _temperatura,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Temperatura'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _descripcion,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripción del lugar'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _urlimagen,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Agregar url imagen del destino'),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(
                height: 16.0,
              ),

              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Text(
                "Tipo de destino turistico",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Escalada"),
                      value: _escalada,
                      selected: _escalada,
                      onChanged: (bool? value) {
                        setState(() {
                          _escalada = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Aventura"),
                      value: _aventura,
                      selected: _aventura,
                      onChanged: (bool? value) {
                        setState(() {
                          _aventura = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Cruceros"),
                      value: _cruceros,
                      selected: _cruceros,
                      onChanged: (bool? value) {
                        setState(() {
                          _cruceros = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Recreación"),
                      value: _recreacion,
                      selected: _recreacion,
                      onChanged: (bool? value) {
                        setState(() {
                          _recreacion = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Senderismo"),
                      value: _senderismo,
                      selected: _senderismo,
                      onChanged: (bool? value) {
                        setState(() {
                          _senderismo = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Trekking"),
                      value: _trekking,
                      selected: _trekking,
                      onChanged: (bool? value) {
                        setState(() {
                          _trekking = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Peregrinación"),
                      value: _peregrinacion,
                      selected: _peregrinacion,
                      onChanged: (bool? value) {
                        setState(() {
                          _peregrinacion = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                      title: const Text("Playa"),
                      value: _playa,
                      selected: _playa,
                      onChanged: (bool? value) {
                        setState(() {
                          _playa = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _saveDestino();
                },
                child: const Text("Guardar destino"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}