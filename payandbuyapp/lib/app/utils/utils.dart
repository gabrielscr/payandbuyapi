import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

formatarData(String data) {
  var date = DateTime.parse(data);
  var format = DateFormat("dd/MM/yyyy HH:mm");

  return format.format(date);
}

irParaPagina(String routeName) {
  Modular.to.pushReplacementNamed(routeName);
}

voltarPagina(String routeName) {
  Modular.to.pushReplacementNamed(routeName);
}

T sum<T extends num>(T lhs, T rhs) => lhs + rhs;
