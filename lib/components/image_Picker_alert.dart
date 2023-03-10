import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:university_app/constant.dart';



Future<File?> PickImage(ImageSource imageSource) async {
  File? ImageFile;
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: imageSource);
  if(image == null) return null;
  ImageFile=await CropImage(File(image.path));
  if(ImageFile == null) return null;
  return ImageFile;
}

Future<File?> CropImage(File image)async{
  CroppedFile? CroppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      compressQuality: 70,
      compressFormat: ImageCompressFormat.jpg,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'ITE Damas',
            toolbarColor: Color1,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
            hideBottomControls: false,
            cropFrameColor: Color1,
            cropGridColor: Color1,
            activeControlsWidgetColor:Color1,
            cropFrameStrokeWidth :3
        )
      ]
  );
  if(CroppedImage == null) return null;
  return File(CroppedImage.path);
}



