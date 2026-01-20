import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

// ignore: must_be_immutable
class CuctomCard extends StatelessWidget {
   CuctomCard({
    super.key,
    required this.product,
  });
ProductModel product;
@override
  Widget build(BuildContext context) {
    return 
     
             GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'update_product_page_id',arguments:  product);
                },
               child: Card(elevation: 6,
                     shadowColor: Colors.grey.withOpacity(0.4),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(12),
                     ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [   Center(
                     child: Image.network(
                       product.image,
                       height: 120,
                       fit: BoxFit.contain,
                     ),
                   ),
                    
                    const SizedBox(height: 10),
                     Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                      
                      
                      ),
               
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                          Text(
                     '\$${product.price}',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(width: 10),
                    Icon( 
                      Icons.heart_broken, 
                      color:  Colors.red,),
                      ],
                    )
                   
                  ],
                           ),
                
                           ),
             );
    
  }
}


































































