import 'package:fire_base_storage/device_info.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String deviceUUID = "";

  @override
  void initState() {
    genDevice();
    super.initState();
  }

  void genDevice() async {
    DeviceInfo deviceInfo = DeviceInfo();
    deviceUUID = await deviceInfo.getDeviceUUID();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(deviceUUID);
    return Container(
      child: Column(
        children: [
          Text("deviceUUID:: $deviceUUID"),
        ],
      ),
    );
  }
}
