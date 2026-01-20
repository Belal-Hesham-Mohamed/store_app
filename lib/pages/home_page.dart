import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widget/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static const String routeName='home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        
    ), 
    
       body: Padding(
         padding: const EdgeInsets.only( top: 20, left: 10),
         child:FutureBuilder<List<ProductModel>>(
          future: GetAllProduct().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
  List<ProductModel> products = snapshot.data!;
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 10,
      childAspectRatio: 0.7,
    ),
    itemCount: products.length,
    itemBuilder: (context, index) {
      return  CuctomCard(product:products[index] );
    },
  );
}else if (snapshot.hasError) {
  return Center(child: Text('Error: ${snapshot.error}')); 
}
return const Center(child: CircularProgressIndicator());
          },
    )
    ),
    );
  }
}

