import 'package:medik/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    // _localStore = LocalStore(_sharedPreferences);
    print("init'd");
    return this;
  }

  Future<void> setBool(String key, bool value) async{
    _pref.setBool(key, true);
  }

  bool getBool(String key) {
    final bool = _pref.getBool(key) ?? false;
    return bool;
  }

}