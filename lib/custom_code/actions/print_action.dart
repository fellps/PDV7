// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:usb_device/usb_device.dart';

Future<String?> printAction() async {
  final UsbDevice usbDevice = UsbDevice();

  // get paired devices
  final pairedDevices = await usbDevice.pairedDevices;

  print(pairedDevices);

  // pair a device
  final pairedDevice = await usbDevice
      .requestDevices([DeviceFilter(vendorId: 0x00, productId: 0x00)]);

  // get device's configurations
  List<USBConfiguration> availableConfigurations =
      await usbDevice.getAvailableConfigurations(pairedDevice);

  // get device's info
  USBDeviceInfo deviceInfo = await usbDevice.getPairedDeviceInfo(pairedDevice);

  // start session
  await usbDevice.open(pairedDevice);

  // close session
  await usbDevice.close(pairedDevice);

  return null;
}
