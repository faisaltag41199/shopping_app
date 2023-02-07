import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

int fromHex(String hexCode){
return int.parse(hexCode
    .replaceFirst("#","ff"),radix: 16);
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}