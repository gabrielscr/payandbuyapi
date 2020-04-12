import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-categorias-controller.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/controllers/app-controller.dart';
import 'package:payandbuyapp/app/controllers/home-contorller.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/views/administracao/admin-home-view.dart';
import 'package:payandbuyapp/app/views/administracao/categorias/admin-categorias-inserir-editar-view.dart';
import 'package:payandbuyapp/app/views/administracao/categorias/admin-categorias-view.dart';
import 'package:payandbuyapp/app/views/administracao/produtos/admin-produtos-inserir-editar-view.dart';
import 'package:payandbuyapp/app/views/administracao/produtos/admin-produtos-view.dart';
import 'package:payandbuyapp/app/views/login/criar-conta-view.dart';
import 'package:payandbuyapp/app/views/login/esqueceu-senha-view.dart';
import 'package:payandbuyapp/app/views/login/login-view.dart';
import 'package:payandbuyapp/app/widgets/app-widget.dart';
import 'package:payandbuyapp/app/widgets/home-widget.dart';
import 'package:payandbuyapp/app/widgets/sem-conexao-widget.dart';
import 'package:payandbuyapp/app/widgets/splash.dart';
import 'package:payandbuyapp/servicos/api/api-service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((inject) => AppController()),
        Bind((inject) => LoginController()),
        Bind((inject) => AdminCategoriasController()),
        Bind<Api>((i) => Api()),
        Bind((inject) => HomeController()),
        Bind((inject) => AdminProdutosController())
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => Splash()),
        Router('/login', child: (_, args) => LoginView()),
        Router('/sem-conexao', child: (_, args) => SemConexaoWidget()),
        Router('/home', child: (_, args) => HomeWidget()),
        Router('/esqueceu-senha', child: (_, args) => RecuperarSenhaView()),
        Router('/criar-conta', child: (_, args) => CriarContaView()),

        /* ADMINISTRAÇÃO */
        Router('/home-admin', child: (_, args) => AdminHomeView()),
        Router('/categorias-admin', child: (_, args) => AdminCategoriasView()),
        Router('/categorias-admin-inserir-editar',
            child: (_, args) => AdminCategoriasInserirEditar(
                  categoriaId: args.data,
                )),
        Router('/produtos-admin', child: (_, args) => AdminProdutosView()),
        Router('/produtos-admin-inserir-editar',
            child: (_, args) => AdminProdutosInserirEditar(
                  produtoId: args.data,
                )),
      ];

  static Inject get to => Inject.of();
}
