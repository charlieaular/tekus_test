import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekus_test/src/features/presentation/routing.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.historicalCurrencyPage,
      getPages: AppRoutes.routes,
    );
  }
}
