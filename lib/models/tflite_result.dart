class TFLiteResult {
  double confidence;
  int index;
  String label;

  TFLiteResult({this.confidence, this.index, this.label});

  TFLiteResult.fromJson(dynamic json) {
    confidence = json['confidence'];
    index = json['index'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidence'] = this.confidence;
    data['index'] = this.index;
    data['label'] = this.label;
    return data;
  }
}
