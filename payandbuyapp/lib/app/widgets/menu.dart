import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(accountName: null, accountEmail: null),
          menuItem("Pedidos", Icon(Ionicons.ios_list), "/pedidos"),
          menuItem("Administração", Icon(Ionicons.ios_settings), "/home-admin"),
          menuItem("Ajuda", Icon(Ionicons.ios_help_circle_outline), "")
        ],
      ),
    );
  }

  menuItem(String titulo, Icon icon, String rota) {
    return ListTile(
      leading: icon,
      title: CustomText(text: titulo, fontSize: null),
      onTap: () {
        Modular.to.pushReplacementNamed(rota);
      },
    );
  }
}
