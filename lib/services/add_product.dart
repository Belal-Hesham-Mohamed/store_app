import 'package:store_app/helper/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
Future<dynamic> addNewProduct({required Map<String, dynamic> productData, String? token}) async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.post(
        url: 'products',
        body: {
            'title': productData['title'],
            'price': productData['price'].toString(),
            'description': productData['description'],
            'image': productData['image'],
            'category': productData['category'],    
        }
        
    );
    return ProductModel.fromJson(response);
}}