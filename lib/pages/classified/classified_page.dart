import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:plant_diagnosis/db/database.dart';
import 'package:plant_diagnosis/helpers/camera_helper.dart';
import 'package:plant_diagnosis/helpers/file_helper.dart';
import 'package:plant_diagnosis/helpers/tflite_helper.dart';
import 'package:plant_diagnosis/models/examples/examples.dart';
import 'package:plant_diagnosis/models/tflite_result.dart';
import 'package:plant_diagnosis/stores/classified/classified_store.dart';

class ClassifiedPage extends StatefulWidget {
  const ClassifiedPage({Key key}) : super(key: key);

  @override
  _ClassifiedPageState createState() => _ClassifiedPageState();
}

class _ClassifiedPageState extends State<ClassifiedPage> {
  final controller = ClassifiedStore();

  @override
  void dispose() {
    TFLiteHelper.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    TFLiteHelper.loadModel(listOfExamples.first);
  }

  _buildImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 92.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Observer(
            builder: (_) {
              return controller.image == null
                  ? Text('Without image')
                  : Stack(
                      children: [
                        Image.file(
                          controller.image,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.35),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: IconButton(
                              iconSize: 20,
                              icon: Icon(Icons.close),
                              onPressed: () {
                                controller.image = null;
                                controller.outputs.clear();
                              },
                            ),
                          ),
                        )
                      ],
                    );
            },
          )),
        ),
      ),
    );
  }

  _buildResult() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
      child: Container(
        // height: 100.0,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.white,
          //   width: 1,
          // ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildResultList(),
      ),
    );
  }

  _buildResultList() {
    return Observer(
      builder: (_) {
        return controller.outputs.isEmpty
            ? Center(
                child: Text('Without results'),
              )
            : Center(
                child: ListView.builder(
                  itemCount: controller.outputs.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          '${controller.outputs[index].label} ( ${(controller.outputs[index].confidence * 100.0).toStringAsFixed(2)} % )',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 14.0,
                          progressColor: Theme.of(context).primaryColor,
                          percent: controller.outputs[index].confidence,
                        ),
                      ],
                    );
                  },
                ),
              );
      },
    );
  }

  Widget buildFloatingButton() {
    return FloatingActionButton(
      child: Icon(Icons.photo_camera),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImage(source: ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_album),
                  title: Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    controller.pickImage(source: ImageSource.gallery);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future addAnalyze() async {
    double latitude;
    double longitude;

    if (controller.saveLocation) {
      final location = await controller.getCurrentLocation();

      latitude = location?.latitude;
      longitude = location?.longitude;
    }

    final imageDir = await FileHelper.saveFile(controller.image);

    print(imageDir.path);

    final analyze = Analyze(
      imageDir: imageDir.path,
      species: 'Morango',
      description: controller.descriptionController.text,
      date: DateTime.now(),
      percentage: controller.outputs.first.confidence,
      note: controller.obsController.text,
      result: controller.outputs.first.label,
      latitude: latitude,
      longitude: longitude,
    );

    controller.addAnalyze(analyze);

    Navigator.pop(context);
    Navigator.pop(context);
  }

  Future _showSaveDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Center(
                  child: Text(
                    'Informações sobre o diagnóstico',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration:
                      InputDecoration(hintText: 'Informe uma descrição'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.obsController,
                  decoration: InputDecoration(
                    hintText: 'Observações',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                  ),
                  maxLines: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Gravar localização?'),
                    Observer(builder: (_) {
                      return Switch(
                        value: controller.saveLocation,
                        onChanged: (value) {
                          controller.saveLocation = value;
                        },
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: addAnalyze,
                  child: Text('Salvar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Análise'),
      ),
      floatingActionButton: Observer(
        builder: (_) {
          return controller.image == null ? SizedBox() : buildFloatingButton();
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return controller.outputs.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Text(
                                'Adicione uma imagem para análise',
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Wrap(
                                          children: <Widget>[
                                            ListTile(
                                              leading: Icon(Icons.photo_camera),
                                              title: Text('Camera'),
                                              onTap: () {
                                                Navigator.pop(context);
                                                controller.pickImage(
                                                  source: ImageSource.camera,
                                                );
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.photo_album),
                                              title: Text('Gallery'),
                                              onTap: () {
                                                Navigator.pop(context);
                                                controller.pickImage(
                                                  source: ImageSource.gallery,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text('Adicionar imagem'),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _buildResult(),
                              _buildImage(),
                            ],
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return controller.outputs.isEmpty
              ? const SizedBox(
                  height: 0,
                  width: 0,
                )
              : Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _showSaveDialog,
                    child: Text('Salvar diagnóstico'),
                  ),
                );
        },
      ),
    );
  }
}
