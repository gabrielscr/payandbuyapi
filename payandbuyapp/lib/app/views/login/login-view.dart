import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/controllers/login-controller.dart';
import 'package:payandbuyapp/app/widgets/loader.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ModularState<LoginView, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) {
            return Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(height: 350, decoration: BoxDecoration()
                      // image: DecorationImage(
                      //     image: AssetImage('assets/images/login.png'),
                      //     fit: BoxFit.fill)),
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
                                      "Email",
                                      controller.changeEmail,
                                      false,
                                      Icon(
                                        Icons.email,
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
                                      Icon(Icons.lock, color: Colors.grey),
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
                                  child: controller.loading
                                      ? Loader()
                                      : Text(
                                          "LOGAR",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ),
                              ),
                              onPressed: () async {
                                await controller.logar();
                              }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () => {},
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(color: Colors.grey),
                          ),
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
