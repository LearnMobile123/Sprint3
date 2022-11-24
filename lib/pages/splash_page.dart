import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_app/pages/home_page.dart';
import 'package:project_app/pages/login_page.dart';
import 'package:project_app/pages/mis_destinos_pag.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplasPageState();
}

class _SplasPageState extends State<SplashPage> {
  void initState() {
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 3), () async {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }
}