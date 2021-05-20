import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/date_helper.dart';
import 'package:plant_diagnosis/routes.dart';
import 'package:plant_diagnosis/stores/classified/classified_store.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ClassifiedStore();

  @override
  void initState() {
    super.initState();
  }

  Widget cardAnalyze({@required Analyze analyze}) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Remover',
          color: Colors.red,
          icon: MdiIcons.delete,
          onTap: () {
            controller.removeAnalyze(analyze.id);
          },
        ),
      ],
      child: Card(
        child: ListTile(
          title: Text(analyze.description),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(analyze.species),
              Text(DateHelper.getDateDDMMYYYY(analyze.date.toString()) +
                  ' - ' +
                  DateHelper.getHourMinute(analyze.date.toString())),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailsDiagnosis,
              arguments: analyze,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Análises'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              StreamBuilder(
                stream: controller.find(),
                initialData: <Analyze>[],
                builder: (BuildContext context,
                    AsyncSnapshot<List<Analyze>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  if (snapshot.data.isEmpty)
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Text(
                          'Nenhuma análise encontada',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );

                  final listOfAnalysis = snapshot.data;
                  listOfAnalysis.reversed;

                  return Column(
                    children: [
                      SizedBox(height: 40),
                      ListView.builder(
                        itemCount: listOfAnalysis.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return cardAnalyze(
                            analyze: listOfAnalysis[index],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, Routes.classifiedPage);
        },
      ),
    );
  }
}
