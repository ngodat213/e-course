import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_flutter/configs/api_path.dart';
import 'package:quiz_flutter/manager/manager_key_storage.dart';
import 'package:quiz_flutter/utils/base_shared_preferences.dart';
import 'package:quiz_flutter/widgets/custom_toast.dart';

class ImagePickerProfile with ChangeNotifier {
  static FirebaseFirestore ref = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  static XFile? image;

  static uploadImage() async {
    final userToken = await BaseSharedPreferences.getStringValue(
        ManagerKeyStorage.accessToken);
    Reference storageRef =
        FirebaseStorage.instance.ref('/profileImage$userToken');
    UploadTask uploadTask = storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();

    ref
        .collection(ApiPath.USER)
        .doc(userToken)
        .update({'photoUrl': newUrl})
        .then((value) => {toastInfo(msg: "Profile update"), image = null})
        .onError((error, stackTrace) => toastInfo(msg: error.toString()));
  }

  static pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      image = file;
      return await file.readAsBytes();
    }
  }
}
