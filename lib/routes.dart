import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/pages/classified/classified_page.dart';
import 'package:plant_diagnosis/pages/details/details_diagnosis_page.dart';
import 'package:plant_diagnosis/pages/home/home_page.dart';
import 'package:plant_diagnosis/pages/maps/map_sample.dart';

class Routes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String login = '/login';
  static const String recoveryPassword = '/recovery_pass';
  static const String home = '/home';
  static const String classifiedPage = '/classified_page';
  static const String detailsDiagnosis = '/details_diagnosis';
  static const String mapsPage = '/maps_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(args);
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => Container());
        break;
      case recoveryPassword:
        return MaterialPageRoute(builder: (_) => Container());
        break;
      case home:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case classifiedPage:
        return MaterialPageRoute(builder: (_) => ClassifiedPage());
        break;
      case detailsDiagnosis:
        return MaterialPageRoute(
          builder: (_) => DetailsDiagnosisPage(
            analyze: args as Analyze,
          ),
        );
        break;
      case mapsPage:
        return MaterialPageRoute(
          builder: (_) => MapSample(
            target: args as LatLng,
          ),
        );
        break;

      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Erro'),
        ),
        body: Container(
          child: Text('Rota não definida'),
        ),
      );
    });
  }
}
