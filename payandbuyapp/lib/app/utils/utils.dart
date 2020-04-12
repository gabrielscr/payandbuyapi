import 'package:intl/intl.dart';

formatarData(String data) {
  var date = DateTime.parse(data);
  var format = DateFormat("dd/MM/yyyy HH:mm");

  return format.format(date);
}
