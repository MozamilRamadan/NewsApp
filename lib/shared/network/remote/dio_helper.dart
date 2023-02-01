import 'package:dio/dio.dart';

import '../local/cache_helper.dart';



class DioHelper {
  static  Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        // عرض البيانات حتى لو حالتها خطأ
        receiveDataWhenStatusError: true,
        headers:{
          'lang': 'en',
        }
      ),
    );
  }

  static Future<Response> postData(

      {
        required String url,
        required Map<String,dynamic> data,
        String lang = 'en',
        String? token,
      }
      ){
    dio!.options.headers = {
      "Content-Type":"application/json",
      'lang':lang,
    'Authorization': token?? '',

    };
    return dio!.post(
        url,
        data: data,
    );
}

  static Future<Response> getData(

      {required String url,required Map<String , dynamic> query,}) async
  {
    return await dio!.get(url , queryParameters: query);
  }

  static Future<Response> letsTry(
      {required String url, String lang = 'en', String? token,}
      ) async {
    dio!.options.headers={
       lang:lang,
      'Authorization': CacheHelper.getData(key: 'token'),
      "Content-Type":"application/json",
    };
    return await dio!.get(url);
  }
  //==============================================================================
  static Future<Response> updateData(

      {
        required String url,
        required Map<String,dynamic> data,
        String lang = 'en',
        String? token,
      }
      ){
    dio!.options.headers = {
      "Content-Type":"application/json",
      'lang':lang,
      'Authorization': token?? '',

    };
    return dio!.put(
      url,
      data: data,
    );
  }

}


//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca