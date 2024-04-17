import 'package:medik/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  // late final SharedPreferences _pref;

  // Future<StorageService> init() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   _pref = await SharedPreferences.getInstance();
  //   // _localStore = LocalStore(_sharedPreferences);
  //   print("init'd");
  //   return this;
  // }




  Future<void> setBool(String key, bool value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, true);
  }

  Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool = prefs.getBool(key) ?? false;
    return bool;
  }

  Future<void> setString (String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> removeString (String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<bool> getIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final val = prefs.getString(AppConstant.userTokenKey)==null ? false : true;
    print("is user logged in>>>$val");
    return  val;
  }


}