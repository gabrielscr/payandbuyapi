import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-categorias-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class AdminCategoriasInserirEditar extends StatefulWidget {
  final String categoriaId;

  const AdminCategoriasInserirEditar({Key key, this.categoriaId})
      : super(key: key);

  @override
  _AdminCategoriasInserirEditarState createState() =>
      _AdminCategoriasInserirEditarState();
}

class _AdminCategoriasInserirEditarState extends ModularState<
    AdminCategoriasInserirEditar, AdminCategoriasController> {
  @override
  void initState() {
    carregar();
    super.initState();
  }

  bool get inserindo => widget.categoriaId == null;

  carregar() async {
    if (!inserindo) await controller.obterCategoria(widget.categoriaId);
  }

  salvar() async {
    if (inserindo)
      await controller.inserirCategoria();
    else
      await controller.editarCategoria();

    Modular.to.pushReplacementNamed('/categorias-admin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: inserindo ? 'Inserir categoria' : 'Editar categoria',
            fontSize: null),
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Modular.to.pushReplacementNamed('/categorias-admin');
            }),
        actions: <Widget>[],
      ),
      body: Observer(builder: (_) {
        var categoria = controller.categoria;

        if (categoria.descricao == null && !inserindo) return Loader();

        return Container(
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: categoria.descricao ?? "",
                onChanged: (v) => categoria.descricao = v,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: InputBorder.none,
                    labelText: 'Descrição',
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: categoria.foto ?? "",
                onChanged: (v) => categoria.foto = v,
                decoration: InputDecoration(
                    labelText: 'Url da foto',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            )
          ]),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(
            Ionicons.ios_checkmark,
            size: 35,
          ),
          onPressed: () async {
            await salvar();
          }),
    );
  }
}
