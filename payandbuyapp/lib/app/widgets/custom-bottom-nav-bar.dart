import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  // var carrinhoController = Modular.get<CarrinhoController>();

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      // controller.currentIndex = index;
      // controller.navigateToScreens(index);
    }

    return Observer(builder: (_) {
      var items = <BottomNavigationBarItem>[
        buildBottomNavigationBarItem(Icon(Ionicons.ios_home)),
        buildBottomNavigationBarItem(Icon(Ionicons.ios_list)),
        buildBottomNavigationBarItem(Icon(Ionicons.ios_heart_empty)),
        // buildBottomNavigationBarItem(
        //   carrinhoController.itens.length > 0
        //       ? Badge(
        //           animationType: BadgeAnimationType.slide,
        //           shape: BadgeShape.circle,
        //           borderRadius: 100,
        //           child: Icon(Ionicons.ios_cart),
        //           badgeContent: Observer(
        //               builder: (_) => Text('${carrinhoController.itens.length}',
        //                   style: TextStyle(color: Colors.white))),
        //         )
        //       : Icon(Ionicons.ios_cart),
        // ),
        buildBottomNavigationBarItem(Icon(Ionicons.ios_person))
      ];
      return BottomNavigationBar(
        items: items,
        // currentIndex: controller.currentIndex,
        // selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        // selectedLabelStyle: TextStyle(color: Colors.black),
        onTap: _onItemTapped,
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      );
    });
  }

  buildBottomNavigationBarItem(Widget icon) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Container(
        height: 0,
      ),
    );
  }
}
