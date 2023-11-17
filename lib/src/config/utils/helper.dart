import 'dart:io';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

bool isLanguageEnglish(String languageCode) {
  return languageCode == "en" ? true : false;
}

Future<bool> requestPermission() async {
  PermissionStatus permissionStatus = await Permission.storage.request();
  if (permissionStatus.isGranted) {
    return true;
  } else if (permissionStatus.isPermanentlyDenied) {
    await openAppSettings();
  }
  return false;
}

void downloadAttachments(List<Attachment> attachments) async {
  bool downloadSuccess = true;
  Directory? dir;
  if (Platform.isIOS) {
    dir = await getApplicationDocumentsDirectory();
  } else {
    // dir = await DownloadsPathProvider.downloadsDirectory;
  }
  if (dir != null) {
    for (var attachment in attachments) {
      try {
        await Dio().download(
          attachment.url ?? "",
          "${dir.path}/${attachment.name ?? ""}",
          onReceiveProgress: (received, total) {},
        );
      } on DioError catch (e) {
        downloadSuccess = false;
        showToastMessage("${e.message.toString()}");
      }
    }
    if(downloadSuccess) {
      showToastMessage(S.current.downloadSuccess);
    } else {
      showToastMessage("Something went wrong");
    }
  }
}

void downloadFile(String file) async {
  bool downloadSuccess = true;
  Directory? dir;
  if (Platform.isIOS) {
    dir = await getApplicationDocumentsDirectory();
  } else {
    // dir = await DownloadsPathProvider.downloadsDirectory;
  }
  if (dir != null) {
    try {
      await Dio().download(
        file,
        "${dir.path}/${file.split("/").last ?? ""}",
        onReceiveProgress: (received, total) {},
      );
    } on DioError catch (e) {
      downloadSuccess = false;
      showToastMessage("${e.message.toString()}");
    }
    if(downloadSuccess) {
      showToastMessage(S.current.downloadSuccess);
    } else {
      showToastMessage("Something went wrong");
    }
  }
}

void showToastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}
