import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-categorias-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/domain/categoria.dart';

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

  carregar() async {
    if (widget.categoriaId != null)
      await controller.obterCategoria(widget.categoriaId);
  }

  salvar() async {
    if (widget.categoriaId == null)
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
        title: CustomText(text: 'Inserir categoria', fontSize: null),
        actions: <Widget>[
          IconButton(
              icon: Icon(Ionicons.ios_return_right),
              onPressed: () {
                Modular.to.pushReplacementNamed('/categorias-admin');
              })
        ],
      ),
      body: Observer(builder: (_) {
        var categoria = controller.categoria;

        return Container(
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                onChanged: (v) => categoria.descricao = v,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: InputBorder.none,
                    hintText: 'Descrição',
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
