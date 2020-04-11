// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return DevicePreview(builder: (context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      // builder: DevicePreview.appBuilder,
      title: 'Pay And Buy',
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Modular.generateRoute,
    );
    // });
  }
}