import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/services/photo_service.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChangeProfilePicture {
  Future<void> show(BuildContext context, WidgetRef ref) async {
    final galleryPermission = await Permission.photos.status;
    if (!galleryPermission.isGranted) {
      final requestedPermission = await Permission.photos.request();
      if (!requestedPermission.isGranted) {
        WarningAlert().show(
          context,
          'permissionDenied'.tr(),
          true,
        );
        return;
      }
    }
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
        compressQuality: 65,
      );
      if (croppedFile != null) {
        final file = File(croppedFile.path);
        final success = await _handleUpdate(file);
        if (success) {
          InformationToast().show(context, 'profilePhotoChanged'.tr());
          await ref.read(profileProvider.notifier).getUser();
        } else {
          WarningAlert().show(context, 'error'.tr(), true);
        }
      }
    }
  }
}

Future<bool> _handleUpdate(File file) async {
  final postResponse = await PhotoService.instance.profile(file);
  if (postResponse == null || !postResponse.success) {
    return false;
  }
  return postResponse.success;
}
