import 'package:dio/dio.dart';

abstract interface class IReceitasDatasource {
  Future get(String id);
}

class ReceitasDatasource implements IReceitasDatasource {
  final Dio dio;

  ReceitasDatasource({required this.dio});

  @override
  Future get(String id) async {
    var response = await dio
        .get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return Exception();
    }
  }
}
