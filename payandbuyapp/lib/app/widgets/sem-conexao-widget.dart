import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SemConexaoWidget extends StatefulWidget {
  @override
  _SemConexaoState createState() => _SemConexaoState();
}

class _SemConexaoState extends State<SemConexaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/no-internet.png',
                height: 350,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Ah não! :(',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Parece que você está sem conexão com o servidor',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                'Tente novamente apertando no botão abaixo',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: RaisedButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color.fromRGBO(63, 61, 86, 50),
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 60, right: 60, bottom: 15, top: 15),
                        child: Text(
                          'Atualizar',
                          style: TextStyle(color: Colors.white),
                        )),
                    onPressed: () {
                      Modular.to.pushReplacementNamed('/home');
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
