import 'package:flutter/material.dart';
import 'package:schach_app/app.dart';
import 'package:schach_app/config/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const SchachApp());
}
