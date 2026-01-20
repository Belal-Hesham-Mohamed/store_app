
import 'package:store_app/helper/api_helper.dart';
import 'package:store_app/models/product_model.dart';
class Category {
Future<List<ProductModel>> CategoryProduct(String type)async{


  List <dynamic> data =await ApiHelper().apiGet('products/category/$type') ;
  List <ProductModel> returnList=[] ;
  for (var element in data){
    returnList.add(ProductModel.fromJson(element));
  }

  return returnList;

}
}
