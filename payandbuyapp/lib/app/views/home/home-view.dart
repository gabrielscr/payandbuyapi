import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/administracao/admin-produtos-controller.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/views/categorias/categorias-view.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';
import 'package:payandbuyapp/app/widgets/ui/sizing-info.dart';
import 'package:payandbuyapp/domain/produto.dart';

class HomeView extends StatefulWidget {
  final SizingInformation sizingInformation;

  const HomeView({Key key, @required this.sizingInformation}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var loginController = Modular.get<LoginController>();
  var produtoController = Modular.get<AdminProdutosController>();

  @override
  void initState() {
    produtoController.listarProdutos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizingInformation = widget.sizingInformation;

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 90,
                child: CategoriaListar(
                  listar: false,
                ),
              ),
            ),
            Expanded(flex: 2, child: buildPromocao(sizingInformation)),
            Expanded(flex: 4, child: buildProdutos(sizingInformation))
          ],
        ));
  }

  obterValorPercentual(String valorOriginal, String valorPromocional) {
    var diferenca =
        double.parse(valorOriginal) - double.parse(valorPromocional);

    var novoValor = diferenca / double.parse(valorOriginal);

    var porcentagem = novoValor * 100;

    return "-${porcentagem.toStringAsFixed(0)}% OFF";
  }

  Widget buildBanner(String src) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: CachedNetworkImage(
        imageUrl: src,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(child: Loader()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  Widget buildPromocao(SizingInformation sizingInformation) {
    return Container(
        width: double.infinity,
        child: Carousel(
          images: [
            buildBanner(
                "https://i.pinimg.com/originals/bc/71/a3/bc71a36db443a525485f737ec33566f4.png"),
            buildBanner(
                "https://www.emlishop.com.br/wp-content/uploads/2019/01/Games-Banner-1140x400.png"),
            buildBanner(
                "https://image.freepik.com/vetores-gratis/banner-de-moda-promocao_1188-223.jpg")
          ],
          dotSize: 5.0,
          dotSpacing: 15.0,
          dotColor: Colors.black,
          boxFit: BoxFit.cover,
          dotBgColor: Colors.black54.withOpacity(0),
          dotIncreasedColor: Colors.grey,
          borderRadius: true,
          radius: Radius.circular(20),
          moveIndicatorFromBottom: 180.0,
          noRadiusForIndicator: true,
        ));
  }

  buildProduto(Produto produto, SizingInformation sizingInformation) {
    var lowMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;
    var mediumMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileMedium;

    return FlatButton(
      padding: EdgeInsets.all(1),
      onPressed: () {
        Modular.to.pushNamed('produto-detalhe', arguments: produto);
      },
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                height: lowMobile ? 120 : mediumMobile ? 140 : 160,
                width: lowMobile ? 120 : mediumMobile ? 140 : 160,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Stack(fit: StackFit.expand, children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Container(
                      height: lowMobile ? 80 : mediumMobile ? 80 : 100.0,
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: produto.banner,
                        placeholder: (context, url) => Center(child: Loader()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  produto.promocao
                      ? Banner(
                          message: obterValorPercentual(
                              produto.valor, produto.valorPromocao),
                          location: BannerLocation.topStart,
                          color: Colors.red,
                          textStyle: TextStyle(),
                        )
                      : Container(),
                ])),
          ),
          SizedBox(
            height: lowMobile ? 0 : 10,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 18, right: 18, bottom: 20),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomText(
                      text: produto.nome,
                      fontSize: lowMobile ? 11 : mediumMobile ? 13 : 15,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: <Widget>[
                        CustomText(
                          text: r'R$' ' ${produto.valor}',
                          fontSize: 11.0,
                          fontWeight: produto.promocao
                              ? FontWeight.w100
                              : FontWeight.normal,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        produto.valorPromocao != null
                            ? CustomText(
                                text: r'R$'
                                    ' ${produto.valorPromocao}',
                                fontSize: 11.0,
                              )
                            : Container()
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  buildProdutos(SizingInformation sizingInformation) {
    return Observer(builder: (_) {
      if (produtoController.produtos.value == null) return Loader();

      return Container(
        child: Column(
          children: <Widget>[
            CustomText(text: 'Novos produtos', fontSize: 15),
            SizedBox(
              height: 10,
            ),
            Scrollbar(
              child: Container(
                height: 210,
                child: GridView.count(
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: 1.1,
                  crossAxisCount: 1,
                  padding: EdgeInsets.all(0),
                  children: List.generate(
                      produtoController.produtos.value.length, (index) {
                    return buildProduto(produtoController.produtos.value[index],
                        sizingInformation);
                  }),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
