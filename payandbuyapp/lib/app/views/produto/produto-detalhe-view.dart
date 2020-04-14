import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class ProdutoDetalheView extends StatefulWidget {
  final String produtoId;
  const ProdutoDetalheView({Key key, @required this.produtoId})
      : super(key: key);

  @override
  _ProdutoDetalheViewState createState() => _ProdutoDetalheViewState();
}

class _ProdutoDetalheViewState
    extends ModularState<ProdutoDetalheView, AdminProdutosController> {
  @override
  void initState() {
    carregar();
    super.initState();
  }

  carregar() async {
    await controller.obterProduto(widget.produtoId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      var produto = controller.produto;

      if (produto.nome == null) return Loader();

      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Modular.to.pushReplacementNamed('/home');
              },
            ),
            pinned: true,
            centerTitle: true,
            title: Text(""),
            actions: <Widget>[
              IconButton(
                  icon: controller.favorito
                      ? Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                  onPressed: () =>
                      controller.handleFavoritoChange(widget.produtoId)),
              IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: null)
            ],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: produto.banner,
                placeholder: (context, url) => Center(child: Loader()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 20),
              color: Colors.white,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: produto.fotos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: CachedNetworkImage(
                      height: 100,
                      width: 100,
                      imageUrl: produto.fotos[index],
                      placeholder: (context, url) => Center(child: Loader()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ));
                  }),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 300,
            delegate: SliverChildListDelegate([
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ]),
          ),
        ],
        //   return Scaffold(
        // appBar: AppBar(
        //   title: CustomText(
        //     text: 'Detalhe do produto',
        //     fontSize: 16,
        //     color: Colors.black,
        //   ),
        //   centerTitle: true,
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //       icon: Icon(Icons.close, color: Colors.black),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       }),
        // ),
        // body: Observer(builder: (_) {
        //   if (controller.produto == null || controller.loading)
        //     return Loader();

        //   var produto = controller.produto;

        //   return SafeArea(
        //       child: Column(children: <Widget>[
        //     Flexible(
        //         flex: 1, child: buildGallery(produto, sizingInformation)),
        //     Flexible(
        //         flex: 2, child: buildCheckout(produto, sizingInformation))
        //   ]));
        // })),
      );
    });
  }
}
