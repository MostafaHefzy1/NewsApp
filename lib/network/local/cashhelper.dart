import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cashHelper
{
  static SharedPreferences  ? sharedpreferences  ;
  static init()async
  {
     sharedpreferences = await SharedPreferences.getInstance() ;
  }

  static  Future <bool?> putData ({
  required String key  ,
  required bool value ,
})
  async{
    return await sharedpreferences?.setBool(key, value) ;
  }


  static  Object? getData(
  {
  required String key ,
})
  {
    return sharedpreferences?.get(key) ;
  }

}