import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/views/categorias/categorias-view.dart';
import 'package:payandbuyapp/app/widgets/menu.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 90,
                  child: CategoriaListar(),
                ),
              ),
              Expanded(flex: 2, child: Container(color: Colors.black)),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                    height: 300,
                  ))
            ],
          )),
    );
  }
}
