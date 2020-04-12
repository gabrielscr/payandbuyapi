import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class AdminProdutosInserirEditar extends StatefulWidget {
  final String produtoId;

  const AdminProdutosInserirEditar({Key key, @required this.produtoId})
      : super(key: key);

  @override
  _AdminProdutosInserirEditarState createState() =>
      _AdminProdutosInserirEditarState();
}

class _AdminProdutosInserirEditarState
    extends ModularState<AdminProdutosInserirEditar, AdminProdutosController> {
  @override
  void initState() {
    carregar();
    super.initState();
  }

  bool get inserindo => widget.produtoId == null;

  carregar() async {
    if (!inserindo) await controller.obterProduto(widget.produtoId);
  }

  salvar() async {
    if (inserindo)
      await controller.inserirProduto();
    else
      await controller.editarProduto();

    Modular.to.pushReplacementNamed('/produtos-admin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            text: inserindo ? 'Inserir produto' : 'Editar produto',
            fontSize: null),
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Modular.to.pushReplacementNamed('/produtos-admin');
            }),
        actions: <Widget>[],
      ),
      body: Observer(builder: (_) {
        var produto = controller.produto;

        if (produto.nome == null && !inserindo) return Loader();

        return Container(
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.nome ?? "",
                onChanged: (v) => produto.nome = v,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    border: InputBorder.none,
                    labelText: 'Nome',
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.banner ?? "",
                onChanged: (v) => produto.banner = v,
                decoration: InputDecoration(
                    labelText: 'Url do banner',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.fotos != null && produto.fotos.length > 0
                    ? produto.fotos[0]
                    : "",
                onChanged: (v) => produto.fotos.add(v),
                decoration: InputDecoration(
                    labelText: 'Foto 1',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.fotos != null && produto.fotos.length > 0
                    ? produto.fotos[1]
                    : "",
                onChanged: (v) => produto.fotos.add(v),
                decoration: InputDecoration(
                    labelText: 'Foto 2',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.descricaoCurta ?? "",
                onChanged: (v) => produto.descricaoCurta = v,
                decoration: InputDecoration(
                    labelText: 'Descrição curta',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.descricaoLonga ?? "",
                onChanged: (v) => produto.descricaoLonga = v,
                decoration: InputDecoration(
                    labelText: 'Descrição longa',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.valor ?? "",
                onChanged: (v) => produto.valor = v,
                decoration: InputDecoration(
                    labelText: 'Valor',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: "${produto.quantidade ?? 0}",
                onChanged: (v) => produto.quantidade = int.parse(v),
                decoration: InputDecoration(
                    labelText: 'Quantidade',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              child: TextFormField(
                initialValue: produto.valorPromocao ?? "",
                onChanged: (v) => produto.valorPromocao = v,
                decoration: InputDecoration(
                    labelText: 'Valor promocional',
                    prefixIcon: Icon(MaterialCommunityIcons.web),
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Text(
                      "Disponível",
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                    ),
                    Center(
                      child: Switch(
                        activeColor: Colors.grey,
                        value: produto.disponivel,
                        onChanged: (v) {
                          produto.disponivel = v;
                        },
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Text(
                      "Promoção",
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                    ),
                    Center(
                      child: Switch(
                        activeColor: Colors.grey,
                        value: produto.promocao,
                        onChanged: (v) {
                          produto.promocao = v;
                        },
                      ),
                    ),
                  ],
                ))
              ],
            ),
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
