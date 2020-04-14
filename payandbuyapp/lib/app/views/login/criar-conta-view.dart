import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';

class CriarContaView extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<CriarContaView, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) {
              return Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Observer(
                                  builder: (_) {
                                    return buildTextFormField(
                                        "Nome",
                                        controller.changeNome,
                                        false,
                                        Icon(
                                          Ionicons.ios_person,
                                          color: Colors.grey,
                                        ),
                                        TextInputType.text,
                                        controller.validateNome);
                                  },
                                ),
                                Observer(
                                  builder: (_) {
                                    return buildTextFormField(
                                        "CPF",
                                        controller.changeCpf,
                                        false,
                                        Icon(
                                          Ionicons.ios_document,
                                          color: Colors.grey,
                                        ),
                                        TextInputType.text,
                                        controller.validateCpf);
                                  },
                                ),
                                Observer(
                                  builder: (_) {
                                    return buildTextFormField(
                                        "Email",
                                        controller.changeEmail,
                                        false,
                                        Icon(
                                          Ionicons.ios_mail,
                                          color: Colors.grey,
                                        ),
                                        TextInputType.emailAddress,
                                        controller.validateEmail);
                                  },
                                ),
                                Observer(
                                  builder: (_) {
                                    return buildTextFormField(
                                        "Senha",
                                        controller.changeSenha,
                                        true,
                                        Icon(Ionicons.ios_lock,
                                            color: Colors.grey),
                                        TextInputType.text,
                                        controller.validatePassword);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Observer(
                            builder: (_) => FlatButton(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey),
                                  child: Center(
                                    child: Text(
                                      "CRIAR CONTA",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  await controller.criarConta();
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            onPressed: () =>
                                Modular.to.pushReplacementNamed('/login'),
                            child: Text(
                              "Já possui uma conta? Entre agora!",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(label, onChanged, isObscure, Icon icon, inputType,
      String Function() errorText) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[100]))),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: isObscure,
        keyboardType: inputType,
        decoration: InputDecoration(
            errorText: errorText == null ? null : errorText(),
            prefixIcon: icon,
            border: InputBorder.none,
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}
