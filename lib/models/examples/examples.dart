import 'package:flutter/foundation.dart';
import 'package:plant_diagnosis/helpers/types.dart';

class Examples {
  final String description;
  final String location;
  final Types type;

  Examples(
      {@required this.description,
      @required this.location,
      @required this.type});
}

final listOfExamples = [
  Examples(
    description: 'Morangos',
    location: 'strawberries',
    type: Types.STRAWBERRIES,
  ),
];
