import 'package:store_app/helper/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel?> addNewProduct({
    required Map<String, dynamic> productData,
    String? token,
  }) async {
    final apiHelper = ApiHelper();

    print('UPDATE PRODUCT BODY: $productData');

    final response = await apiHelper.put(
      url: 'products/${productData['id']}',
      body: {
        'title': productData['title'],
        'price': productData['price'], // ✅ number
        'description': productData['description'],
        'image': productData['image'],
        'category': productData['category'],
      },
    );

    print('UPDATE PRODUCT RESPONSE: $response');

    if (response == null || response.isEmpty) {
      print('⚠️ Empty response from API');
      return null;
    }

    return ProductModel.fromJson(response);
  }
}
