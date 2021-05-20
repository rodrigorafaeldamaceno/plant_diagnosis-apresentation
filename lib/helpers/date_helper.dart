import 'package:intl/intl.dart';

class DateHelper {
  static String getDateDDMMYYYY(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(parsedDate);
  }

  static String getHourMinute(String data) {
    // elimina o fuso horario da data
    List<String> newDate = data.split('-');
    String dataBr = newDate[0] + newDate[1] + newDate[2];

    var parsedDate = DateTime.parse(dataBr);

    DateFormat dateFormat = DateFormat.Hm('pt_BR');

    return dateFormat.format(parsedDate);
  }
}
