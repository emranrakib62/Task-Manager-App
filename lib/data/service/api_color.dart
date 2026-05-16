import 'dart:ffi';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_manager/data/model/api_response.dart';

class ApiColor{
static final Logger _logger=Logger();

static Future<ApiResponse>getRequest({required String URL}) async {
  try{
    _logRequest(URL);
Uri uri=Uri.parse(URL);
Response response= await get(uri,headers: {
  'token' :''
});
if(response.statusCode==200){
  return ApiResponse(responseCode: 200, responseData: , isSuccess: isSuccess, errorMessage: errorMessage)
}
  }catch($c){

  }

}
static void _logRequest(String URL,{Map<String,dynamic>?body}){
  _logger.i(
    'URL=>$URL \n'
        'Body=> $body\n'
  );
}
}



