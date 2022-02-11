import 'package:dio/dio.dart';
import 'package:flutter_ecom/repository/model/product_model.dart';

const String _baseURL = 'https://fakestoreapi.com';

class ApiClientResponse {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseURL,
    sendTimeout: 30000,
    connectTimeout: 30000,
  ));

  Future<List<Product>?> fetchProduct() async {
    try {
      Response response = await _dio.get('/products');
      if (response.statusCode == 200) {
        List<dynamic> product = response.data;
        return product.map((e) => Product.formJson(e)).toList();
      }
    } on DioError catch (e) {
      e.toString();
    }
  }
}
