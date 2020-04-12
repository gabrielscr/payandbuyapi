import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-bottom-nav-bar.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
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
      appBar: AppBar(
        title: CustomText(text: 'Pay And Buy', fontSize: null),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Ionicons.ios_log_out),
              onPressed: () => loginController.logoff())
        ],
      ),
      body: Container(
        child: Center(
          child: CustomText(text: 'AAA', fontSize: null),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
