import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/Models/user.dart' as UserApp;
import 'package:project_app/Models/destino.dart';

class FirebaseApi {
  Future<String?> registerUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    }  on FirebaseException  catch (e) {
      print("FirebaseExeption ${e.code}");
      return e.code ;
    }
  }
  Future<String?> logInUser(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    }  on FirebaseException  catch (e) {
      print("FirebaseExeption ${e.code}");
      return e.code ;
    }
  }

  Future<String> createUser(UserApp.User user) async {
    try {
      final document = await FirebaseFirestore.instance.collection("users").doc(user.uid).set(user.toJson()); // Agrega uid a id de Firestor Database
      return user.uid;
    }on FirebaseException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    }
  }

  Future<String> createDestino(Destino destino) async {
    try{
      final uid = FirebaseAuth.instance.currentUser?.uid;
      final document = FirebaseFirestore.instance.collection("users").doc(uid).collection("destinos").doc();
      destino.id = document.id;

      final result = FirebaseFirestore.instance.collection("users").doc(uid).collection("destinos").doc(destino.id).set(destino.toJson());
      return destino.id;
    } on FirebaseException catch (e) {
      print("FirebaseAuthExeption ${e.code}");
      return e.code;
    }
  }
}