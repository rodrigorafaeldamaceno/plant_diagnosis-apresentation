// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classified_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassifiedStore on _ClassifiedStoreBase, Store {
  final _$saveLocationAtom = Atom(name: '_ClassifiedStoreBase.saveLocation');

  @override
  bool get saveLocation {
    _$saveLocationAtom.reportRead();
    return super.saveLocation;
  }

  @override
  set saveLocation(bool value) {
    _$saveLocationAtom.reportWrite(value, super.saveLocation, () {
      super.saveLocation = value;
    });
  }

  final _$imageAtom = Atom(name: '_ClassifiedStoreBase.image');

  @override
  File get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$outputsAtom = Atom(name: '_ClassifiedStoreBase.outputs');

  @override
  ObservableList<TFLiteResult> get outputs {
    _$outputsAtom.reportRead();
    return super.outputs;
  }

  @override
  set outputs(ObservableList<TFLiteResult> value) {
    _$outputsAtom.reportWrite(value, super.outputs, () {
      super.outputs = value;
    });
  }

  final _$pickImageAsyncAction = AsyncAction('_ClassifiedStoreBase.pickImage');

  @override
  Future<dynamic> pickImage({ImageSource source}) {
    return _$pickImageAsyncAction.run(() => super.pickImage(source: source));
  }

  @override
  String toString() {
    return '''
saveLocation: ${saveLocation},
image: ${image},
outputs: ${outputs}
    ''';
  }
}
