import 'dart:convert';

import 'package:e_commerce_app/Model_class/Product_model.dart';
import 'package:http/http.dart' as http;
class ApiDataColing
{

  static ApiDataColing apiDataColing=ApiDataColing();

  Future<List<ProductModel>> apiData()
  async {
    String link="https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(link));
    List jsonData = jsonDecode(response.body);

    print(jsonData);

    List<ProductModel> productItem = jsonData.map((e) => ProductModel.fromJson(e)).toList();

    print(productItem);
    return productItem;
  }
}