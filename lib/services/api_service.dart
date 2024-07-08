import 'package:dio/dio.dart';

class ApiService{

  final Dio dio = Dio();
  final baseUrl = 'https://api.quotable.io';

  Future<dynamic> get({
    required String endpoint,
    String? token,
  }) async {
    Options options = Options(
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    try {
      Response response = await dio.get('${baseUrl}/${endpoint}', options: options);
      if (response.statusCode == 200) {
        print(response.data);
        return response;
      } else {
        throw Exception(
            'There is a problem with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to get data: $e');
    }
  }

}


// void main(){
//   ApiService().get(endpoint: 'quotes/_92j6kAvwd');
// }
