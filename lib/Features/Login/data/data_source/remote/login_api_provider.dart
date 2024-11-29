import 'package:danial_asadi/cores/config/constants.dart';
import 'package:dio/dio.dart';

class LoginApiProvider {
  final Dio dio;
  LoginApiProvider(this.dio);

  Future<Response> login({required String email , required String pass }) async {
    Response res = await dio.get(
        '${Constants.dioBaseUrl}/login',
        data: {
          
          
           "email": email,
           
            "password": pass
        
        
        
        });
  
    print(res.statusCode);
    return res;
  }



  Future<Response> register({required String email , required String pass }) async {
    Response res = await dio.post(
        '${Constants.dioBaseUrl}/login',
        data: {
          
          
           "email": email,
           
            "password": pass
        
        
        
        });
  
    print(res.statusCode);
    return res;
  }
}
