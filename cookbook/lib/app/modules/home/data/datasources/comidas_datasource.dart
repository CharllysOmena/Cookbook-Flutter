import 'package:dio/dio.dart';

abstract interface class IComidasDatasource {
  Future get(String categoria);
}

class ComidasDatasource implements IComidasDatasource {
  final Dio dio;

  ComidasDatasource({required this.dio});

  @override
  Future get(String categoria) async {
    print("datasource");
    var response = await dio
        .get("https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoria");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return Exception();
    }
  }
}
