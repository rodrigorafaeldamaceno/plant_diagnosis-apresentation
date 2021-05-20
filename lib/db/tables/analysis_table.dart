import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("Analyze")
class Analysis extends Table {
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get imageDir => text()();
  TextColumn get result => text().nullable()();
  TextColumn get species => text()();
  TextColumn get description => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  RealColumn get percentage => real()();
}
