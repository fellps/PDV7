// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// Begin custom widget code

import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_imei/device_imei.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String?> deviceIMEIAction() async {
  var permission = await Permission.phone.status;
  final _deviceImeiPlugin = DeviceImei();

  if (Platform.isAndroid) {
    if (permission.isGranted) {
      return await _deviceImeiPlugin.getDeviceImei();
    }
  }

  return null;
}
