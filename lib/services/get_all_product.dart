
import 'package:store_app/helper/api_helper.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProduct {
Future <List<ProductModel>> getAllProducts()async {

  List <dynamic> data =await ApiHelper().apiGet('products');
  List <ProductModel> returnList=[] ;
  for (int i=0;i<data.length;i++){
  var element =data[i];{
    returnList.add(ProductModel.fromJson(element));
  }}
  return returnList;
}
  
  
  
}