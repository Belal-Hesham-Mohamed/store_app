import 'package:flutter/material.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/update_product.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
                 
       

      
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        UpdateProductPage.routeName: (context) =>  UpdateProductPage(),
      },
    );
  }
}