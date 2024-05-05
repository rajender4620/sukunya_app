import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sukunya/app/app.dart';
import 'package:sukunya/bootstrap.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  bootstrap(
    () => DevicePreview(builder: (context) => const App()),
  );
  FlutterNativeSplash.remove();
}
