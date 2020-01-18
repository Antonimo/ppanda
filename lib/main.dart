import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ppanda/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(Application());
}
