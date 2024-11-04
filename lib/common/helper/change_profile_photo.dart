import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ChangeCoverPhoto {
  Future<bool> showImagePickerDialog(
    BuildContext context,
  ) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        compressQuality: 65,
      );
      if (croppedFile != null) {
        //  PhotoUploadedFunction().show(context);
        final bytes = await croppedFile.readAsBytes();
        final success = await handleUpdate(bytes);
        if (success) {
        } else {
          /* ErrorFunction().show(
            context,
          );*/
        }
        return success;
      }
    }
    return false;
  }

  static Future<bool> handleUpdate(Uint8List? bytes) async {
    if (bytes != null) {
      /*try {
        final converted = base64Encode(bytes);
        final userService = UserService.instance;
        final postResponse = await userService.coverPhoto(converted);
        return postResponse['success'];
      } catch (e) {
        print('Error updating profile picture: $e');
        return false;
      }*/
    }
    return false;
  }
}
