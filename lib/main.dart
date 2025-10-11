import 'package:flutter/material.dart';
import 'package:grosnap/core/theme/app_theme.dart';
import 'package:grosnap/core/utils/const.dart';
import 'package:grosnap/features/bottom_nav/presentation/screen/bottom_nav_screen.dart';

import 'core/di/injection.dart';

void main() {

  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    getSize(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: BottomNavScreen(),
    );
  }
}