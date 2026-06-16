import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/model/user_model.dart';

class AuthController{
static String _accessTokenKey='token';
static String _userModelKey='user_data';
static final Logger _logger=Logger();

static String ? accessToken;
static UserModel ? userModel;

static Future saveUserData(UserModel model,String token) async {
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
await sharedPreferences.setString(_accessTokenKey, token);
  await  sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson()));
accessToken=token;
userModel=model;
_logger.i(accessToken);
  _logger.i(userModel);



}


}