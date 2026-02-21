import 'package:flutter/material.dart';
import 'package:schach_app/config/routes.dart';
import 'package:schach_app/shared/theme/app_theme.dart';

class SchachApp extends StatelessWidget {
  const SchachApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Schach Lernen',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
