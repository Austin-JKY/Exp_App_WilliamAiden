import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app_fi/core/route/app_route.dart';
import 'package:my_app_fi/core/utils/model/add_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().router,
    );
  }
}
