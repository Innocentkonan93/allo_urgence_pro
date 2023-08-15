import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadImage(String path, String filePath) async {
    File file = File(filePath);
    String? downloadLink;
    Reference ref =
        _firebaseStorage.ref().child(path).child("${DateTime.now()}");
    TaskSnapshot uploadTask = await ref.putFile(file).whenComplete(() {});
    downloadLink = await uploadTask.ref.getDownloadURL();

    return downloadLink;
  }

  Future<UploadTask> uploadFiles(String path, String filePath) async {
    File file = File(filePath);
    Reference ref = _firebaseStorage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    return uploadTask;
  }
}
