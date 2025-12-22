import 'dart:developer';
import 'dart:io';

import 'package:mbayat_user_app/Utils/allExport.dart';

class PermissionService {
  // Check the current status of permissions
  static Future<bool> checkPermissions(bool isRequest) async {
    final notificationStatus = await Permission.notification.status;
    final cameraStatus = await Permission.camera.status;
    final microphoneStatus = await Permission.microphone.status;
    final locationStatus = await Permission.locationWhenInUse.status;
    final galleryStatus = await Permission.storage.status; // Android
    final photosStatus = await Permission.photos.status; // iOS

    log("Notification -> ${notificationStatus.isGranted}");
    log("Camera -> ${cameraStatus.isGranted}");
    log("Microphone -> ${microphoneStatus.isGranted}");
    log("Location -> ${locationStatus.isGranted}");
    if (Platform.isIOS) log("Photos -> ${photosStatus.isGranted}");
    if (!Platform.isIOS) log("Storage -> ${galleryStatus.isGranted}");

    if (Platform.isIOS) {
      if (notificationStatus.isGranted &&
          cameraStatus.isGranted &&
          microphoneStatus.isGranted &&
          photosStatus.isGranted &&
          locationStatus.isGranted) {
        return true;
      }
    } else {
      if (notificationStatus.isGranted &&
          cameraStatus.isGranted &&
          microphoneStatus.isGranted &&
          galleryStatus.isGranted &&
          locationStatus.isGranted) {
        return true;
      }
    }

    if (isRequest) {
      await requestPermissions();
    }
    return false;
  }

  // Request all permissions
  static Future<void> requestPermissions() async {
    await Permission.notification.request();
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.locationWhenInUse.request();

    if (Platform.isIOS) {
      await Permission.photos.request();
    } else {
      await Permission.storage.request();
    }
  }
}
