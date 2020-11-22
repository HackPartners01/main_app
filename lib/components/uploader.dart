import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_app/data_models/product.dart';
import 'package:main_app/screens/sell_page.dart';
import 'package:main_app/screens/sell_page_part2.dart';

class Uploader extends StatefulWidget {
  final File file;
  Product p;

  Uploader({Key key, this.file, this.p}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UploaderState(file, p);
  }
}

class UploaderState extends State<Uploader> {
  File file;
  Product p;

  UploaderState(File file, Product p) {
    this.file = file;
    this.p = p;
  }

  FirebaseStorage _storage = FirebaseStorage(
      storageBucket: 'gs://raste-ka-maal-saste-me-3b071.appspot.com');
  UploadTask task;
  String downloadUrl;

  void startUpload() {
    String filePath = 'images/${DateTime.now()}.png';
    _storage.ref().child(filePath).putFile(widget.file).whenComplete(() => {
          downloadUrl =
              _storage.ref().child(filePath).getDownloadURL().toString(),
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("File Uploaded Successfully"))),
          p.networkImageAddress = downloadUrl,
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SellPage(),
            ),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      label: Text('Save Image'),
      icon: Icon(Icons.save),
      onPressed: startUpload,
    );
  }
}
