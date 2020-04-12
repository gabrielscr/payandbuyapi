import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/utils/utils.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class AdminProdutosView extends StatefulWidget {
  @override
  _AdminProdutosViewState createState() => _AdminProdutosViewState();
}

class _AdminProdutosViewState
    extends ModularState<AdminProdutosView, AdminProdutosController> {
  @override
  void initState() {
    controller.listarProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      floatingActionButton: renderFloatButton(),
      body: renderLista(),
    );
  }

  Widget renderFloatButton() {
    return FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        child: Icon(Ionicons.ios_add),
        onPressed: () {
          Modular.to.pushReplacementNamed('/produtos-admin-inserir-editar');
        });
  }

  Widget renderAppBar() {
    return AppBar(
      centerTitle: true,
      title: CustomText(text: 'Produtos', fontSize: null),
      leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Modular.to.pushReplacementNamed('/home-admin');
          }),
    );
  }

  Widget renderLista() {
    return Observer(builder: (_) {
      bool carregando =
          controller.produtos == null || controller.produtos.value == null;

      if (carregando) return Loader();

      var produtos = controller.produtos.value;

      if (produtos.length == 0) return renderListaVazia();

      return ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return Card(
              borderOnForeground: true,
              child: ListTile(
                title: CustomText(
                  text: produtos[index].nome,
                  fontSize: null,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomText(
                    text:
                        'Criado em: ${formatarData(produtos[index].criadoEm)}',
                    fontSize: null),
                trailing: IconButton(
                    icon: Icon(
                      Ionicons.ios_trash,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Modular.to.showDialog(
                          child: renderAlertaExcluir(produtos[index].id));
                    }),
                onTap: () {
                  Modular.to.pushReplacementNamed(
                      '/produtos-admin-inserir-editar',
                      arguments: produtos[index].id);
                },
              ),
            );
          });
    });
  }

  Widget renderAlertaExcluir(String produtoId) {
    return AlertDialog(
      title: CustomText(
        text: 'Deseja realmente excluir?',
        fontSize: null,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            CustomText(text: 'Esta ação não pode ser desfeita', fontSize: null)
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: CustomText(
            text: 'Não',
            fontSize: null,
            color: Colors.black,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        FlatButton(
          child: CustomText(
            text: 'Sim',
            fontSize: null,
            color: Colors.red,
          ),
          onPressed: () async {
            await controller.excluirProduto(produtoId);
            Modular.to.pop();
          },
        ),
      ],
    );
  }

  Widget renderListaVazia() {
    return Center(
      child: CustomText(text: 'Não há produtos cadastrados.', fontSize: null),
    );
  }
}
