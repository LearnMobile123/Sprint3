import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:project_app/Models/user.dart';
import 'package:project_app/pages/login_page.dart';
import 'package:project_app/repository/firebase_api.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {

  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  String _data = "Información: ";

  Genre? _genre = Genre.masculino;

  bool _aventura = false;
  bool _senderismo = false;
  bool _playa = false;

  String buttonMsg = "Fecha de nacimiento";

  String _date = "";

  String _dateConverter(DateTime newDate) {
    final DateFormat formatter = DateFormat('yyyy-mm-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showSelecDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if (newDate != null) {
      setState(() {
        _date = _dateConverter(newDate);
        buttonMsg = "Fecha de nacimiento ${_date.toString()}";
      });
    }
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _saveUser(User user) async {
    var result = await  _firebaseApi.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

  }

  void _registerUser(User user)  async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg ="";
    if (result == "invalid-email"){msg = "El correo electrónico está mal escrito";} else
    if (result == "weak-password"){msg = "La contraseña debe tener mínimo 6 dígitos";} else
    if (result == "email-already-in-use"){msg = "Ya existe una cuena registrada con este correo electrónico ";} else
    if (result == "network-request-failed"){msg = "Revise conexion a internet";} else {
      msg = "Usuario registrado con éxito ";
      user.uid = result;
      _saveUser(user);
    }
    _showMsg(msg);

  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        String genre = "Masculino";
        String favoritos = "";
        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        if (_aventura) favoritos = "$favoritos Aventura";
        if (_senderismo) favoritos = "$favoritos Senderismo";
        if (_playa) favoritos = "$favoritos Playa";

        var user = User("",
            _name.text, _email.text, _password.text, genre, favoritos, _date);
        _registerUser(user);
      } else {
        _showMsg("Las contraseñas deben ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              // Permite hacer desplazamiento sin afectar pantalla
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('assets/images/logo.png')),
                  const SizedBox(
                    height: 16.0,
                  ),
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
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electrónico'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repeita contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Masculino'),
                          leading: Radio<Genre>(
                              value: Genre.masculino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Femenino'),
                          leading: Radio<Genre>(
                              value: Genre.femenino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Destinos favoritos',
                    style: TextStyle(fontSize: 20),
                  ),
                  CheckboxListTile(
                    title: const Text('Aventura'),
                    value: _aventura,
                    selected: _aventura,
                    onChanged: (bool? value) {
                      setState(() {
                        _aventura = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Senderismo'),
                    value: _senderismo,
                    selected: _senderismo,
                    onChanged: (bool? value) {
                      setState(() {
                        _senderismo = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Playa'),
                    value: _playa,
                    selected: _playa,
                    onChanged: (bool? value) {
                      setState(() {
                        _playa = value!;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _showSelecDate();
                    },
                    child: Text(buttonMsg),
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}