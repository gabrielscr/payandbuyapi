import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/menu-admin.dart';

class AdminHomeView extends StatefulWidget {
  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: 'Administração', fontSize: null),
        actions: <Widget>[
          IconButton(
              icon: Icon(Ionicons.ios_return_right),
              onPressed: () {
                Modular.to.pushReplacementNamed('/home');
              })
        ],
      ),
      body: Container(child: Center()),
      drawer: MenuAdmin(),
    );
  }
}
