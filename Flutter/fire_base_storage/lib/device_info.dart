import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  Future<String> getDeviceUUID() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String _uuid = "";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      _uuid = androidDeviceInfo.id;
      _uuid = _uuid.replaceAll(".", "-");
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      _uuid = iosDeviceInfo.identifierForVendor!;
    } else {
      throw Exception("지원하지 않음");
    }

    return _uuid;
  }
}
