import 'package:dio/dio.dart';
import 'package:myapp/common/utils/constrants.dart';
import 'package:myapp/global.dart';

class HttpUtil{

  late Dio dio;


  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil(){
    return _instance;
  }
  HttpUtil._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json
    );
    dio = Dio(options);
  }

  Map<String, dynamic>? getAuthorizationHeader(){
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
    
  }
  post(String path,{Object? data, Map<String, dynamic>? queryParameters, Options? options} ) async {
    print('hit post method');
    Options requestOptions = options?? Options();
    requestOptions.headers = requestOptions.headers??{};
    Map<String, dynamic>? authorization =getAuthorizationHeader();
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    print("done with header");
    var response = await dio.post(path, data:  data, queryParameters:  queryParameters, options:  requestOptions);
    print("done with post ");
    return response.data;
  }

  }

