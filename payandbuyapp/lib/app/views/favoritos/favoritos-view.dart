import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/controllers/carrinho-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';
import 'package:payandbuyapp/domain/favorito.dart';
import 'package:payandbuyapp/domain/produto.dart';

class FavoritosView extends StatefulWidget {
  @override
  _FavoritosViewState createState() => _FavoritosViewState();
}

class _FavoritosViewState
    extends ModularState<FavoritosView, AdminProdutosController> {
  var carrinhoController = Modular.get<CarrinhoController>();
  // final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    controller.listarFavoritos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  buildNoResults() {
    return Center(
        child: CustomText(text: 'Nenhum favorito encontrado.', fontSize: null));
  }

  buidlList(List<Favorito> produtos) {
    return Container(
      child: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index) {
          var produtoJaAdicionado =
              carrinhoController.itens.any((e) => e.id == produtos[index].id);

          return Card(
            color: Colors.grey[50],
            margin: EdgeInsets.all(1),
            borderOnForeground: true,
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Ionicons.ios_remove_circle_outline),
                            onPressed: () =>
                                controller.removerFavorito(produtos[index].id))
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Modular.to.pushNamed('produto-detalhe',
                                arguments: produtos[index]);
                          },
                          child: CachedNetworkImage(
                            height: 150,
                            imageUrl: produtos[index].banner,
                            placeholder: (context, url) =>
                                Center(child: Loader()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CustomText(
                              text: produtos[index].nome,
                              fontSize: null,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            CustomText(
                                text: r'R$' '${produtos[index].valor}',
                                fontSize: null)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              elevation: 0,
                              child: Row(children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  size: 18,
                                ),
                                CustomText(
                                    text: produtoJaAdicionado
                                        ? 'ADICIONADO'
                                        : 'CARRINHO',
                                    fontSize: 13)
                              ]),
                              onPressed: () => carrinhoController
                                  .addItemCarrinho(produtos[index]),
                            ),
                          ],
                        )
                      ],
                    ))
              ],
            ),
            // child: ListTile(
            //     leading: Row(
            //       children: <Widget>[
            //         CachedNetworkImage(
            //             width: 100,
            //             height: 100,
            //             fit: BoxFit.cover,
            //             placeholder: (context, _) => CircularProgressIndicator(
            //                   valueColor: new AlwaysStoppedAnimation<Color>(
            //                       Colors.black),
            //                 ),
            //             imageUrl: produtos[index].banner),
            //       ],
            //     ),
            //     title: Text(produtos[index].nome),
            //     subtitle: Text(r'$' + ' ${produtos[index].valor}'),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 ProdutoDetail(produtoId: produtos[index].id)),
            //       );
            //     }),
          );
        },
      ),
    );
  }

  Widget buildBody() {
    controller.listarFavoritos();
    return Observer(builder: (_) {
      if (controller.favoritos == null || controller.loading) return Loader();

      var produtos = controller.favoritos;

      if (produtos.length == 0) return buildNoResults();

      return Column(
        children: <Widget>[
          // new Container(child: buildSearchForm(produtos)),
          new Expanded(child: buidlList(produtos))
        ],
      );
    });
  }
}
