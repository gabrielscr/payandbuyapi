import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/custom-text.dart';

class CustomAlert extends StatefulWidget {
  final String titulo;
  final String msg;

  const CustomAlert({Key key, @required this.msg, @required this.titulo})
      : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(
        text: widget.titulo,
        fontSize: null,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[CustomText(text: widget.msg, fontSize: null)],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Fechar'),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ],
    );
  }
}
