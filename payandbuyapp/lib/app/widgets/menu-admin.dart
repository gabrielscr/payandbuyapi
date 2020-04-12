import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';

class MenuAdmin extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(accountName: null, accountEmail: null),
          menuItem("Categorias", Icon(Ionicons.ios_list), "/categorias-admin"),
          menuItem("Produtos", Icon(Ionicons.ios_cart), "/produtos-admin"),
          menuItem("Pedidos", Icon(Ionicons.ios_checkmark), "/admin-pedidos"),
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
