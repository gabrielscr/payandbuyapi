import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/home-contorller.dart';
import 'package:payandbuyapp/app/views/carrinho/carrinho-view.dart';
import 'package:payandbuyapp/app/views/categorias/categorias-view.dart';
import 'package:payandbuyapp/app/views/favoritos/favoritos-view.dart';
import 'package:payandbuyapp/app/views/home/home-view.dart';
import 'package:payandbuyapp/app/views/perfil/perfil-view.dart';
import 'package:payandbuyapp/app/widgets/menu.dart';

import 'custom-bottom-nav-bar.dart';
import 'custom-text.dart';
import 'ui/base-widget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends ModularState<HomeWidget, HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: BaseWidget(builder: (context, sizingInformation) {
          return Scaffold(
              key: _scaffoldKey,
              appBar: buildAppBar(),
              drawer: Menu(),
              bottomNavigationBar: BottomNavBarWidget(),
              body: Observer(builder: (_) {
                return IndexedStack(
                  index: controller.currentIndex,
                  children: <Widget>[
                    HomeView(
                      sizingInformation: sizingInformation,
                    ),
                    CategoriaListar(
                      listar: true,
                    ),
                    FavoritosView(),
                    CarrinhoView(),
                    PerfilView()
                  ],
                );
              }));
        }));
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[50],
      title: CustomText(
        text: 'Pay and Buy',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      leading: new IconButton(
          icon: new Icon(
            Icons.short_text,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {})
      ],
    );
  }
}
