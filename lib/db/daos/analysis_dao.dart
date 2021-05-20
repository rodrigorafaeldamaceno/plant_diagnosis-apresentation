import 'package:moor_flutter/moor_flutter.dart';
import 'package:plant_diagnosis/db/tables/analysis_table.dart';

import '../database.dart';

part 'analysis_dao.g.dart';

@UseDao(tables: [Analysis])
class AnalysisDAO extends DatabaseAccessor<MyDatabase> with _$AnalysisDAOMixin {
  AnalysisDAO(MyDatabase db) : super(db);

  Stream<List<Analyze>> find() {
    return select(analysis).watch();
  }

  Future<List<Analyze>> findList() {
    return select(analysis).get();
  }

  Future addAnalyze(Analyze analyze) {
    return into(analysis).insert(analyze).catchError((e) => print(e));
  }

  Future updateAnalyze(Analyze analyze) {
    return update(analysis).replace(analyze).catchError((e) => print(e));
  }

  Future removeAnalyze(int id) {
    return (delete(analysis)..where((cat) => cat.id.equals(id)))
        .go()
        .catchError((e) => print(e));
  }
}
