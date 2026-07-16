import 'package:flutter/material.dart';
import 'package:pda_app/app/routes/app_routes.dart';
import 'package:pda_app/app/routes/route_names.dart';
import 'package:pda_app/modules/login/widgets/login_form.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      routes: AppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
