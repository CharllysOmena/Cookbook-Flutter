import 'package:dio/dio.dart';

abstract interface class ICategoriaDatasource {
  Future get();
}

class CategoriaDatasoruce implements ICategoriaDatasource {
  final Dio dio;

  CategoriaDatasoruce({required this.dio});

  @override
  Future get() async {
    var response =
        await dio.get("https://www.themealdb.com/api/json/v1/1/categories.php");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return Exception();
    }
  }
}
