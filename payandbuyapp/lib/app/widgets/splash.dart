import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    checarLogin();
    super.initState();
  }

  checarLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('token') == null) {
      Modular.to.pushReplacementNamed('/login');
    } else {
      Modular.to.pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loader(),
    );
  }
}
