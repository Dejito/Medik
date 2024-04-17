import 'package:medik/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setBool() async{
    _pref.setBool(AppConstant.storageDeviceOpenFirstTime, true);
  }

  bool getBool() {
    final bool = _pref.getBool(AppConstant.storageDeviceOpenFirstTime) ?? false;
    return bool;
  }

}