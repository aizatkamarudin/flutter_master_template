import 'package:flutter/material.dart';
import 'package:flutter_master_template/router/route.dart' as router;
import 'package:flutter_master_template/router/router_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      // initialRoute: homeScreenRoute,
      initialRoute: loginScreen2Route,
    );
  }
}
