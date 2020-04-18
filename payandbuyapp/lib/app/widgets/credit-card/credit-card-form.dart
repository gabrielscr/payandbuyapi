import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:payandbuyapp/app/widgets/ui/base-widget.dart';
import 'package:payandbuyapp/app/widgets/ui/sizing-info.dart';

import 'credit-card-model.dart';
import 'credit-card-widget.dart';

class CreditCardForm extends StatefulWidget {
  const CreditCardForm({
    Key key,
    this.cardNumber,
    this.expiryDate,
    this.cardHolderName,
    this.cvvCode,
    @required this.onCreditCardModelChange,
    this.themeColor,
    this.textColor = Colors.black,
    this.cursorColor,
  }) : super(key: key);

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final void Function(CreditCardModel) onCreditCardModelChange;
  final Color themeColor;
  final Color textColor;
  final Color cursorColor;

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  var cartaoController = Modular.get<dynamic>();
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;
  bool isCvvFocused = false;
  Color themeColor;

  void Function(CreditCardModel) onCreditCardModelChange;
  CreditCardModel creditCardModel;

  final MaskedTextController _cardNumberController =
      MaskedTextController(mask: '0000000000000000');
  final TextEditingController _expiryDateController =
      MaskedTextController(mask: '00/0000');
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cvvCodeController =
      MaskedTextController(mask: '000');

  FocusNode cvvFocusNode = FocusNode();

  void textFieldFocusDidChange() {
    creditCardModel.isCvvFocused = cvvFocusNode.hasFocus;
    onCreditCardModelChange(creditCardModel);
  }

  void createCreditCardModel() {
    cardNumber = widget.cardNumber ?? '';
    expiryDate = widget.expiryDate ?? '';
    cardHolderName = widget.cardHolderName ?? '';
    cvvCode = widget.cvvCode ?? '';

    creditCardModel = CreditCardModel(
        cardNumber, expiryDate, cardHolderName, cvvCode, isCvvFocused);
  }

  @override
  void initState() {
    super.initState();

    createCreditCardModel();

    onCreditCardModelChange = widget.onCreditCardModelChange;

    cvvFocusNode.addListener(textFieldFocusDidChange);

    _cardNumberController.addListener(() {
      setState(() {
        cardNumber = _cardNumberController.text;
        creditCardModel.cardNumber = cardNumber;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _expiryDateController.addListener(() {
      setState(() {
        expiryDate = _expiryDateController.text;
        creditCardModel.expiryDate = expiryDate;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cardHolderNameController.addListener(() {
      setState(() {
        cardHolderName = _cardHolderNameController.text;
        creditCardModel.cardHolderName = cardHolderName;
        onCreditCardModelChange(creditCardModel);
      });
    });

    _cvvCodeController.addListener(() {
      setState(() {
        cvvCode = _cvvCodeController.text;
        creditCardModel.cvvCode = cvvCode;
        onCreditCardModelChange(creditCardModel);
      });
    });
  }

  @override
  void didChangeDependencies() {
    themeColor = widget.themeColor ?? Theme.of(context).primaryColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, sizingInformation) {
      var lowMobile =
          sizingInformation.deviceScreenType == DeviceScreenType.MobileLow;

      return Theme(
        data: ThemeData(
          primaryColor: themeColor.withOpacity(0.8),
          primaryColorDark: themeColor,
        ),
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 16, top: 0, right: 16),
                child: TextFormField(
                  controller: _cardNumberController,
                  cursorColor: widget.cursorColor ?? themeColor,
                  style: TextStyle(
                      color: widget.textColor, fontSize: lowMobile ? 12 : 16),
                  decoration: InputDecoration(
                    errorText: cartaoController.validarCartao(),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Número do cartão',
                    labelStyle: TextStyle(fontSize: lowMobile ? 13 : 17),
                    hintText: 'xxxx xxxx xxxx xxxx',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 16, top: 10, right: 16),
                      child: TextFormField(
                        controller: _expiryDateController,
                        cursorColor: widget.cursorColor ?? themeColor,
                        style: TextStyle(
                            color: widget.textColor,
                            fontSize: lowMobile ? 12 : 16),
                        decoration: InputDecoration(
                            isDense: true,
                            errorText: cartaoController.validarData(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            labelText: 'Data de expiração',
                            labelStyle:
                                TextStyle(fontSize: lowMobile ? 13 : 17),
                            hintText: 'MM/AAAA'),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      margin:
                          const EdgeInsets.only(left: 16, top: 10, right: 16),
                      child: TextField(
                        focusNode: cvvFocusNode,
                        controller: _cvvCodeController,
                        cursorColor: widget.cursorColor ?? themeColor,
                        style: TextStyle(
                            color: widget.textColor,
                            fontSize: lowMobile ? 12 : 16),
                        decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            labelText: 'CVV',
                            labelStyle:
                                TextStyle(fontSize: lowMobile ? 13 : 17),
                            hintText: 'XXX',
                            errorText: cartaoController.validarCvv()),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onChanged: (String text) {
                          setState(() {
                            cvvCode = text;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                margin: const EdgeInsets.only(left: 16, top: 10, right: 16),
                child: TextFormField(
                  controller: _cardHolderNameController,
                  cursorColor: widget.cursorColor ?? themeColor,
                  style: TextStyle(
                      color: widget.textColor, fontSize: lowMobile ? 12 : 16),
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      labelText: 'Titular do cartão',
                      labelStyle: TextStyle(fontSize: lowMobile ? 13 : 17),
                      errorText: cartaoController.validarTitular()),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
