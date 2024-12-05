import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/services/api_service.dart';
import 'core/utils/app_routes.dart';

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
