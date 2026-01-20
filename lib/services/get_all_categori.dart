
import 'package:store_app/helper/api_helper.dart';
class GetAllCategori {
Future <List<dynamic>> getAllCategories()async {
//products/categories
 
  List <dynamic> data =await ApiHelper().apiGet('products/categories');
    return data;

  
  
  }

}