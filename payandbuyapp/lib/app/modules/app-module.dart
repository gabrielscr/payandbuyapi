import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/app-controller.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/views/home/home-view.dart';
import 'package:payandbuyapp/app/views/login/login-view.dart';
import 'package:payandbuyapp/app/widgets/app-widget.dart';
import 'package:payandbuyapp/app/widgets/splash.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((inject) => AppController()),
        Bind((inject) => LoginController()),
        Bind<Api>((i) => Api()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Splash()),
        Router('/login', child: (_, args) => LoginView()),
        Router('/home', child: (_, args) => HomeView())
      ];

  static Inject get to => Inject.of();
}
