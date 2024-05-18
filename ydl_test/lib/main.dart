import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ydl_test/controller/homecontroller.dart';
import 'package:ydl_test/view/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeController())],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: DashBoard(),
      ),
    );
  }
}
