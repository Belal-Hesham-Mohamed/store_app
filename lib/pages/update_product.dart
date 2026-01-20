import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_filed.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static const String routeName = 'update_product_page_id';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  int? productPrice;

  String? productImageUrl;

  String? productDescription;

  int? productId;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(
              color: Color.fromARGB(245, 179, 151, 28),
              fontWeight: FontWeight.bold,
            ),
          ),

          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),

          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Update Product Name',
                  keyboardType: TextInputType.name,
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                CustomTextField(
                  hintText: 'Update Product Price',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (data) {
                    productPrice = int.tryParse(data);
                  },
                ),
                CustomTextField(
                  hintText: 'Update image Url',
                  keyboardType: TextInputType.url,
                  onChanged: (data) {
                    productImageUrl = data;
                  },
                ),
                CustomTextField(
                  hintText: 'Update Product Description',
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    productDescription = data;
                  },
                ),

                CustomButton(
                  text: 'Update Product',
                  onTap: ()async {
                    isLoading = true;
                    setState(() {});

                    try {
                     await UpdateProductSupmit(product);
                      print('Product Updated Successfully');
                    } on Exception catch (e) {
                      print('Error occurred: $e');
                       
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> UpdateProductSupmit(ProductModel product)async {
    await UpdateProduct().addNewProduct(
      productData: {
        'title': productName ==product.title || productName == null
            ? product.title
            : productName!,
        'price': productPrice == product.price.toInt() || productPrice == null
            ? product.price
            : productPrice!,
        'description': productDescription==product.description || productDescription == null
            ? product.description
            : productDescription!,
        'image': productImageUrl==  product.image || productImageUrl == null
            ? product.image
            : productImageUrl!,
        'category': product.category,
        'id': product.id,
      },
    );
  }
}
