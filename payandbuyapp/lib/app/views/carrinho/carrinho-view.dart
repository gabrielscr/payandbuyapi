import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/carrinho-controller.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/ui/base-widget.dart';
import 'package:payandbuyapp/app/widgets/ui/sizing-info.dart';

class CarrinhoView extends StatefulWidget {
  @override
  _CarrinhoViewState createState() => _CarrinhoViewState();
}

class _CarrinhoViewState
    extends ModularState<CarrinhoView, CarrinhoController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      return buildBody(sizingInformation);
    });
  }

  Widget buildEmpty(SizingInformation sizingInformation) {
    var lowMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;
    var mediumMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileMedium;

    return Center(
        child: Column(
      children: <Widget>[
        Image.asset('assets/login.png'),
        CustomText(
          text: 'Seu carrinho está vazio.',
          fontSize: lowMobile ? 15 : mediumMobile ? 16 : 18,
        ),
      ],
    ));
  }

  Widget buildBody(SizingInformation sizingInformation) {
    return new Observer(builder: (_) {
      var carrinhoVazio =
          controller.itens == null || controller.itens.length == 0;

      var lowMobile =
          sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;

      if (carrinhoVazio) return buildEmpty(sizingInformation);

      return Column(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.grey[300],
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: CustomText(
                        text: 'TOTAL', fontSize: lowMobile ? 12 : 15)),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: CustomText(
                      text: '${controller.itens.length} produto(s)',
                      fontSize: lowMobile ? 12 : 15),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                      onPressed: () => controller.itens.clear(),
                      child: CustomText(
                          text: 'LIMPAR CARRINHO',
                          fontSize: lowMobile ? 12 : 15,
                          color: Colors.red)),
                ),
              ],
            ),
          ),
          Expanded(child: buidlList(sizingInformation)),
          Container(
            child: buildCheckout(sizingInformation),
          ),
        ],
      );
    });
  }

  buildCheckout(SizingInformation sizingInformation) {
    var lowMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;
    var mediumMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileMedium;

    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(
                    text: 'Total:',
                    fontSize: lowMobile ? 14 : mediumMobile ? 18 : 20),
                CustomText(
                    text: r' R$'
                        ' ${controller.subtotal.toStringAsFixed(2)}',
                    fontSize: lowMobile ? 14 : mediumMobile ? 18 : 20),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
            elevation: 0,
            padding: EdgeInsets.all(15),
            color: Colors.deepPurpleAccent,
            onPressed: () => Modular.to.pushReplacementNamed('/cartao-page'),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Center(
                child: CustomText(
                  text: 'CHECKOUT',
                  fontSize: lowMobile ? 14 : mediumMobile ? 15 : 16,
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }

  buidlList(SizingInformation sizingInformation) {
    var itensCarrinho = controller.itens;

    var lowMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;
    var mediumMobile =
        sizingInformation.deviceScreenType == DeviceScreenType.MobileMedium;

    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width - 2,
        child: ListView.builder(
          itemCount: itensCarrinho.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
              elevation: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      dense: true,
                      leading: CachedNetworkImage(
                          width: lowMobile ? 30 : mediumMobile ? 40 : 50,
                          height: lowMobile ? 30 : mediumMobile ? 40 : 50,
                          fit: BoxFit.cover,
                          placeholder: (context, _) =>
                              CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.black),
                              ),
                          imageUrl: itensCarrinho[index].banner),
                      subtitle: CustomText(
                          text: r'R$ '
                              '${itensCarrinho[index].valorBruto == null ? itensCarrinho[index].valor : itensCarrinho[index].valorBruto}',
                          fontSize: lowMobile ? 10 : mediumMobile ? 12 : 14),
                      title: CustomText(
                        text: itensCarrinho[index].nome,
                        fontSize: lowMobile ? 11 : mediumMobile ? 14 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        itensCarrinho[index].quantidade == 1
                            ? Flexible(child: Container())
                            : Flexible(
                                child: IconButton(
                                    icon: Icon(MaterialCommunityIcons.minus,
                                        size: lowMobile
                                            ? 16
                                            : mediumMobile ? 22 : 25,
                                        color: Colors.black),
                                    onPressed: () =>
                                        controller.diminuirQuantidade(
                                            itensCarrinho[index])),
                              ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: CustomText(
                              text: '${itensCarrinho[index].quantidade}',
                              fontSize:
                                  lowMobile ? 10 : mediumMobile ? 13 : 14),
                        ),
                        Flexible(
                          child: IconButton(
                              disabledColor: Colors.white,
                              icon: Icon(MaterialCommunityIcons.plus,
                                  color: Colors.black,
                                  size:
                                      lowMobile ? 16 : mediumMobile ? 22 : 25),
                              onPressed: () => controller
                                  .aumentarQuantidade(itensCarrinho[index])),
                        ),
                        Flexible(
                          child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                                size: lowMobile ? 16 : mediumMobile ? 22 : 25,
                              ),
                              onPressed: () => controller
                                  .removerItemCarrinho(itensCarrinho[index])),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
