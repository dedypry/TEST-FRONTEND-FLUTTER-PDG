import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prout_digital_labs/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Prout Digital Lab",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
