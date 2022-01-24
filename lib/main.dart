import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/core/theme/app_theme.dart';
import 'app/routes/pages.dart';
import 'app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Blogger());
}

class Blogger extends StatelessWidget {
  const Blogger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String entryRoute = Routes.home;

    return Platform.isAndroid
        ? GetMaterialApp(
            theme: AppTheme.lightMode(context),
            debugShowCheckedModeBanner: false,
            initialRoute: entryRoute,
            getPages: AppPages.pages)
        : GetCupertinoApp(
            theme: AppTheme.cupertinoLight(),
            debugShowCheckedModeBanner: false,
            initialRoute: entryRoute,
            getPages: AppPages.pages,
          );
  }
}
