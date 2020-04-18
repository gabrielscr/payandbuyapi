import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payandbuyapp/app/controllers/usuario-controller.dart';
import 'package:payandbuyapp/app/widgets/const.dart';
import 'package:payandbuyapp/app/widgets/credit-card/credit-card-widget.dart';
import 'package:payandbuyapp/app/widgets/custom-alert.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends ModularState<PerfilView, UsuarioController> {
  File _image;
  var _uploadTask;
  bool isLoading = false;

  final MaskedTextController dataNascimentoController =
      MaskedTextController(mask: '00/00/0000');

  @override
  void initState() {
    controller.obterUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Loader() : buildBody();
  }

  Future submit() async {
    // if (_image != null)
    //   controller.usuario.fotoUrl = await controller.uploadFoto(_image);

    await controller.salvarUsuario();
  }

  Widget buildBody() {
    return Observer(builder: (_) {
      return Container(
        child: ListView(children: <Widget>[
          FlatButton(
            child: CustomText(text: 'SALVAR', fontSize: null),
            onPressed: () async {
              if (controller.isValid)
                await submit();
              else
                Modular.to.showDialog(
                    child: CustomAlert(
                        msg: 'Preencha todos os campos em destaque',
                        titulo: 'Ocorreu um erro'));
            },
          ),
          SizedBox(
            height: 10,
          ),
          // buildWallet(),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: _image != null
                ? Column(
                    children: <Widget>[
                      Container(
                          child: CircleAvatar(
                              radius: 50, backgroundImage: FileImage(_image))),
                      _uploadTask == null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.edit),
                                      Text("Editar")
                                    ],
                                  ),
                                  onPressed: _cropImage,
                                ),
                                FlatButton(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(Icons.delete),
                                      Text("Excluir")
                                    ],
                                  ),
                                  onPressed: _clearImage,
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  )
                : Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(text: 'Foto de perfil', fontSize: 16),
                      SizedBox(
                        height: 10,
                      ),
                      buildAvatar(),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
          ),
          buildForm(),
        ]),
      );
    });
  }

  // Future addCredits() async {
  //   try {
  //     String qrResult = await BarcodeScanner.scan();

  //     setState(() {
  //       qrCodeResult = qrResult;
  //     });

  //     var result = await WalletService()
  //         .post("/QrCode/LerQrCode", {'token': qrCodeResult});

  //     if (result) {
  //       await showSucess(
  //           "Sucesso!", "Seus pontos foram adicionados.", context, null);
  //     } else
  //       showError("O seu QRCode é inválido.", context);
  //   } on PlatformException catch (e) {
  //     if (e.code == BarcodeScanner.CameraAccessDenied) {
  //       setState(() {
  //         qrCodeResult = "A permissão de câmera foi negada.";
  //       });
  //     } else {
  //       setState(() {
  //         qrCodeResult = "Erro desconhecido: $e";
  //       });
  //     }
  //   } on FormatException {
  //     setState(() {
  //       qrCodeResult =
  //           "Você pressionou o botão de voltar antes de scannear alguma coisa.";
  //     });
  //   } catch (e) {
  //     showError("O seu QRCode é inválido.", context);
  //   }
  // }

  // Widget buildWallet() {
  //   return Card(
  //     margin: EdgeInsets.all(10),
  //     elevation: 10,
  //     child: Container(
  //       child: Column(
  //         children: <Widget>[
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Text(
  //             'Carteira',
  //             style: TextStyle(fontSize: 16),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               CustomText(
  //                 text: r'Limite disponível: R$'
  //                     "${widget.usuario.saldo.toStringAsFixed(2)}",
  //                 fontSize: 15,
  //               ),
  //               SizedBox(
  //                 width: 50,
  //               ),
  //               RaisedButton(
  //                 color: Colors.grey[100],
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(10)),
  //                 child: Row(
  //                   children: <Widget>[
  //                     CustomText(
  //                       text: 'Adicionar',
  //                       fontSize: 15,
  //                     ),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Icon(MdiIcons.plus)
  //                   ],
  //                 ),
  //                 onPressed: () => addCredits(),
  //               ),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildAvatar() {
    return CircleAvatar(
      radius: 50,
      child: Stack(children: <Widget>[
        Center(
            child: ClipOval(
          child: CachedNetworkImage(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: Loader()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: controller.usuario.fotoUrl != null
                  ? controller.usuario.fotoUrl
                  : Const.userNoPhoto),
        )),
        Container(
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(left: 80),
          child: IconButton(
            icon: Icon(
              Ionicons.ios_camera,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () => showModal(),
          ),
        )
      ]),
    );
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _image.path,
        maxHeight: 1000,
        maxWidth: 1000,
        cropStyle: CropStyle.circle,
        iosUiSettings: IOSUiSettings(
            cancelButtonTitle: 'Cancelar', doneButtonTitle: 'Finalizar'),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar foto',
          toolbarColor: Colors.grey,
        ));

    setState(() {
      _image = cropped ?? _image;
    });
  }

  void _clearImage() {
    setState(() {
      _image = null;
    });
  }

  Widget buildForm() {
    return Observer(builder: (_) {
      var usuario = controller.usuario;

      if (usuario.nome == null) return Loader();

      dataNascimentoController.text = usuario.dataNascimento;

      return Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('Pessoal', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: usuario.nome,
                    decoration: InputDecoration(
                      errorText: controller.validarUsuario(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: 'Nome',
                    ),
                    onChanged: (v) => usuario.nome = v,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: usuario.cpf,
                            decoration: InputDecoration(
                              errorText: controller.validarCpf(),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              labelText: 'CPF',
                            ),
                            onChanged: (v) => usuario.cpf = v),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: dataNascimentoController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            errorText: controller.validarDataNascimento == null
                                ? null
                                : controller.validarDataNascimento(),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Data de nascimento',
                          ),
                          onChanged: (v) => usuario.dataNascimento = v,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          initialValue: usuario.ddd,
                          decoration: InputDecoration(
                            errorText: controller.validarDdd == null
                                ? null
                                : controller.validarDdd(),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'DDD',
                          ),
                          onChanged: (v) => usuario.ddd = v,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 4,
                        child: TextFormField(
                          initialValue: usuario.celular,
                          decoration: InputDecoration(
                            errorText: controller.validarCelular(),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Celular',
                          ),
                          onChanged: (v) => usuario.celular = v,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text('Endereço', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      usuario.cep = v;

                      controller.obterCep(v);
                    },
                    initialValue: usuario.cep,
                    decoration: InputDecoration(
                      errorText: controller.validarCep(),
                      labelText: "CEP",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: usuario.bairro,
                    keyboardType: TextInputType.text,
                    onChanged: (v) => usuario.bairro,
                    decoration: InputDecoration(
                      labelText: "Bairro",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    onChanged: (v) => usuario.cidade = v,
                    initialValue: usuario.cidade,
                    decoration: InputDecoration(
                      labelText: "Cidade",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    onChanged: (v) => usuario.uf = v,
                    initialValue: usuario.uf,
                    decoration: InputDecoration(
                      labelText: "Estado",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.text,
                    onChanged: (v) => usuario.logradouro = v,
                    initialValue: usuario.logradouro,
                    decoration: InputDecoration(
                      labelText: "Rua",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (v) => usuario.numero = v,
                    initialValue: usuario.numero,
                    decoration: InputDecoration(
                      labelText: "Número",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    initialValue: usuario.complemento,
                    onChanged: (v) => usuario.complemento = v,
                    decoration: InputDecoration(
                      labelText: "Complemento",
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  showModal() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        child: new CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            child: Text("Cancelar"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Selecione uma opção',
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Câmera'),
              onPressed: () => pickImage(ImageSource.camera),
            ),
            CupertinoActionSheetAction(
              child: Text('Galeria'),
              onPressed: () => pickImage(ImageSource.gallery),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(
        source: source, maxWidth: 1000, maxHeight: 1000);

    setState(() {
      _image = selected;
    });

    startTime();
  }

  void navigationPage() {
    Navigator.pop(context);
  }

  startTime() async {
    var _duration = new Duration(milliseconds: 200);
    return new Timer(_duration, navigationPage);
  }
}
