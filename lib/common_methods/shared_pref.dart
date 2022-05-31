import 'package:shared_preferences/shared_preferences.dart';

import '../sharedPreferences/shared_preferences_util.dart';

class CommonSharePref {
  static setData(keyname, keydata) async {
    SharedPreferences prefs =
        await SharedPreferencesUtil.getSharedPreferences();
    prefs.setString(keyname, keydata);
  }

 static Future getData(keyname)async{
        SharedPreferences prefs =
        await SharedPreferencesUtil.getSharedPreferences();
      var keyData  =prefs.getString(keyname);
      print("KEY DATA"+keyData.toString());
         return keyData;
  }
}
