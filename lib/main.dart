import 'package:ava_take_home_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM with Riverpod',
      theme: ThemeData(
          // primaryColor: acIndigo, // Set the primary color to purple
          ),
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
