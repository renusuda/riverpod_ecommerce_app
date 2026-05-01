import 'package:ecommerce_app/src/pages/product_list_page.dart';
import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        extensions: const [AppSpacing.standard],
      ),
      home: const ProductListPage(),
    );
  }
}
