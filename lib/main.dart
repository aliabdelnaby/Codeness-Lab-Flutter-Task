import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/router/app_routes.dart';
import 'core/services/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService()); // Dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task',
      initialRoute: AppRoutes.postsView,
      getPages: AppRoutes.routes,
    );
  }
}
