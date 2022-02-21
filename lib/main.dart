import 'package:flutter/material.dart';
import 'package:flutter_demo_app/data/providers/theme_provider.dart';
import 'package:flutter_demo_app/presentation/pages/products/MainProducts.dart';
import 'package:flutter_demo_app/presentation/pages/products/Products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => toggleBackgroundColor()),
      ChangeNotifierProvider(create: (_) => ThemeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AllProducts(),
        appBar: AppBar(
          title: Text("All Products"),
        ),
      ),
      theme: ThemeData(
          scaffoldBackgroundColor:
              context.watch<toggleBackgroundColor>().bgColor),
    );
  }
}
