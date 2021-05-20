// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Analyze extends DataClass implements Insertable<Analyze> {
  final int id;
  final String imageDir;
  final String result;
  final String species;
  final String description;
  final DateTime date;
  final String note;
  final double latitude;
  final double longitude;
  final double percentage;
  Analyze(
      {this.id,
      @required this.imageDir,
      this.result,
      @required this.species,
      @required this.description,
      @required this.date,
      this.note,
      this.latitude,
      this.longitude,
      @required this.percentage});
  factory Analyze.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Analyze(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      imageDir: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}image_dir']),
      result:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}result']),
      species:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}species']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      note: stringType.mapFromDatabaseResponse(data['${effectivePrefix}note']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      percentage: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}percentage']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || imageDir != null) {
      map['image_dir'] = Variable<String>(imageDir);
    }
    if (!nullToAbsent || result != null) {
      map['result'] = Variable<String>(result);
    }
    if (!nullToAbsent || species != null) {
      map['species'] = Variable<String>(species);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<double>(percentage);
    }
    return map;
  }

  AnalysisCompanion toCompanion(bool nullToAbsent) {
    return AnalysisCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      imageDir: imageDir == null && nullToAbsent
          ? const Value.absent()
          : Value(imageDir),
      result:
          result == null && nullToAbsent ? const Value.absent() : Value(result),
      species: species == null && nullToAbsent
          ? const Value.absent()
          : Value(species),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
    );
  }

  factory Analyze.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Analyze(
      id: serializer.fromJson<int>(json['id']),
      imageDir: serializer.fromJson<String>(json['imageDir']),
      result: serializer.fromJson<String>(json['result']),
      species: serializer.fromJson<String>(json['species']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String>(json['note']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      percentage: serializer.fromJson<double>(json['percentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'imageDir': serializer.toJson<String>(imageDir),
      'result': serializer.toJson<String>(result),
      'species': serializer.toJson<String>(species),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String>(note),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'percentage': serializer.toJson<double>(percentage),
    };
  }

  Analyze copyWith(
          {int id,
          String imageDir,
          String result,
          String species,
          String description,
          DateTime date,
          String note,
          double latitude,
          double longitude,
          double percentage}) =>
      Analyze(
        id: id ?? this.id,
        imageDir: imageDir ?? this.imageDir,
        result: result ?? this.result,
        species: species ?? this.species,
        description: description ?? this.description,
        date: date ?? this.date,
        note: note ?? this.note,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        percentage: percentage ?? this.percentage,
      );
  @override
  String toString() {
    return (StringBuffer('Analyze(')
          ..write('id: $id, ')
          ..write('imageDir: $imageDir, ')
          ..write('result: $result, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          imageDir.hashCode,
          $mrjc(
              result.hashCode,
              $mrjc(
                  species.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(
                          date.hashCode,
                          $mrjc(
                              note.hashCode,
                              $mrjc(
                                  latitude.hashCode,
                                  $mrjc(longitude.hashCode,
                                      percentage.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Analyze &&
          other.id == this.id &&
          other.imageDir == this.imageDir &&
          other.result == this.result &&
          other.species == this.species &&
          other.description == this.description &&
          other.date == this.date &&
          other.note == this.note &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.percentage == this.percentage);
}

class AnalysisCompanion extends UpdateCompanion<Analyze> {
  final Value<int> id;
  final Value<String> imageDir;
  final Value<String> result;
  final Value<String> species;
  final Value<String> description;
  final Value<DateTime> date;
  final Value<String> note;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double> percentage;
  const AnalysisCompanion({
    this.id = const Value.absent(),
    this.imageDir = const Value.absent(),
    this.result = const Value.absent(),
    this.species = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.percentage = const Value.absent(),
  });
  AnalysisCompanion.insert({
    this.id = const Value.absent(),
    @required String imageDir,
    this.result = const Value.absent(),
    @required String species,
    @required String description,
    @required DateTime date,
    this.note = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    @required double percentage,
  })  : imageDir = Value(imageDir),
        species = Value(species),
        description = Value(description),
        date = Value(date),
        percentage = Value(percentage);
  static Insertable<Analyze> custom({
    Expression<int> id,
    Expression<String> imageDir,
    Expression<String> result,
    Expression<String> species,
    Expression<String> description,
    Expression<DateTime> date,
    Expression<String> note,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<double> percentage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageDir != null) 'image_dir': imageDir,
      if (result != null) 'result': result,
      if (species != null) 'species': species,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (percentage != null) 'percentage': percentage,
    });
  }

  AnalysisCompanion copyWith(
      {Value<int> id,
      Value<String> imageDir,
      Value<String> result,
      Value<String> species,
      Value<String> description,
      Value<DateTime> date,
      Value<String> note,
      Value<double> latitude,
      Value<double> longitude,
      Value<double> percentage}) {
    return AnalysisCompanion(
      id: id ?? this.id,
      imageDir: imageDir ?? this.imageDir,
      result: result ?? this.result,
      species: species ?? this.species,
      description: description ?? this.description,
      date: date ?? this.date,
      note: note ?? this.note,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (imageDir.present) {
      map['image_dir'] = Variable<String>(imageDir.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (species.present) {
      map['species'] = Variable<String>(species.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisCompanion(')
          ..write('id: $id, ')
          ..write('imageDir: $imageDir, ')
          ..write('result: $result, ')
          ..write('species: $species, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }
}

class $AnalysisTable extends Analysis with TableInfo<$AnalysisTable, Analyze> {
  final GeneratedDatabase _db;
  final String _alias;
  $AnalysisTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _imageDirMeta = const VerificationMeta('imageDir');
  GeneratedTextColumn _imageDir;
  @override
  GeneratedTextColumn get imageDir => _imageDir ??= _constructImageDir();
  GeneratedTextColumn _constructImageDir() {
    return GeneratedTextColumn(
      'image_dir',
      $tableName,
      false,
    );
  }

  final VerificationMeta _resultMeta = const VerificationMeta('result');
  GeneratedTextColumn _result;
  @override
  GeneratedTextColumn get result => _result ??= _constructResult();
  GeneratedTextColumn _constructResult() {
    return GeneratedTextColumn(
      'result',
      $tableName,
      true,
    );
  }

  final VerificationMeta _speciesMeta = const VerificationMeta('species');
  GeneratedTextColumn _species;
  @override
  GeneratedTextColumn get species => _species ??= _constructSpecies();
  GeneratedTextColumn _constructSpecies() {
    return GeneratedTextColumn(
      'species',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _noteMeta = const VerificationMeta('note');
  GeneratedTextColumn _note;
  @override
  GeneratedTextColumn get note => _note ??= _constructNote();
  GeneratedTextColumn _constructNote() {
    return GeneratedTextColumn(
      'note',
      $tableName,
      true,
    );
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedRealColumn _latitude;
  @override
  GeneratedRealColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedRealColumn _constructLatitude() {
    return GeneratedRealColumn(
      'latitude',
      $tableName,
      true,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedRealColumn _longitude;
  @override
  GeneratedRealColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedRealColumn _constructLongitude() {
    return GeneratedRealColumn(
      'longitude',
      $tableName,
      true,
    );
  }

  final VerificationMeta _percentageMeta = const VerificationMeta('percentage');
  GeneratedRealColumn _percentage;
  @override
  GeneratedRealColumn get percentage => _percentage ??= _constructPercentage();
  GeneratedRealColumn _constructPercentage() {
    return GeneratedRealColumn(
      'percentage',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        imageDir,
        result,
        species,
        description,
        date,
        note,
        latitude,
        longitude,
        percentage
      ];
  @override
  $AnalysisTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'analysis';
  @override
  final String actualTableName = 'analysis';
  @override
  VerificationContext validateIntegrity(Insertable<Analyze> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('image_dir')) {
      context.handle(_imageDirMeta,
          imageDir.isAcceptableOrUnknown(data['image_dir'], _imageDirMeta));
    } else if (isInserting) {
      context.missing(_imageDirMeta);
    }
    if (data.containsKey('result')) {
      context.handle(_resultMeta,
          result.isAcceptableOrUnknown(data['result'], _resultMeta));
    }
    if (data.containsKey('species')) {
      context.handle(_speciesMeta,
          species.isAcceptableOrUnknown(data['species'], _speciesMeta));
    } else if (isInserting) {
      context.missing(_speciesMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note'], _noteMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage'], _percentageMeta));
    } else if (isInserting) {
      context.missing(_percentageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Analyze map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Analyze.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AnalysisTable createAlias(String alias) {
    return $AnalysisTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AnalysisTable _analysis;
  $AnalysisTable get analysis => _analysis ??= $AnalysisTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [analysis];
}
