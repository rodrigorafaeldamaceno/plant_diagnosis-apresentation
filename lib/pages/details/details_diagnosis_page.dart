import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/date_helper.dart';
import 'package:plant_diagnosis/routes.dart';

class DetailsDiagnosisPage extends StatefulWidget {
  final Analyze analyze;

  const DetailsDiagnosisPage({Key key, @required this.analyze})
      : super(key: key);

  @override
  _DetailsDiagnosisPageState createState() => _DetailsDiagnosisPageState();
}

class _DetailsDiagnosisPageState extends State<DetailsDiagnosisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(widget.analyze.imageDir),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Planta ${widget.analyze.result} - ${(widget.analyze.percentage * 100).toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Analise feita no dia: ${DateHelper.getDateDDMMYYYY(widget.analyze.date.toString()) + ' - ' + DateHelper.getHourMinute(widget.analyze.date.toString())}',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: widget.analyze.latitude != null &&
                    widget.analyze.longitude != null,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.mapsPage,
                      arguments: LatLng(
                        widget.analyze.latitude,
                        widget.analyze.longitude,
                      ),
                    );
                  },
                  child: Text('Ver no mapa'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.analyze.note ?? '',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
