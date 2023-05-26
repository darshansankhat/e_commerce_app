import 'package:e_commerce_app/Model_class/Product_model.dart';
import 'package:e_commerce_app/utils/api_Helper.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier
{
  Future<List<ProductModel>> apiDataParsing()
  async {

    return await ApiDataColing.apiDataColing.apiData();
  }
}