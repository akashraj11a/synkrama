import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass{
  String key = "token";
  setItems(String token)async{
    SharedPreferences setPref = await SharedPreferences.getInstance();
    setPref.setString(key, token);
  }
  getItem()async {
    SharedPreferences getPref = await SharedPreferences.getInstance();
    var token = getPref.getString(key);
    if (token != null || token != "") {
      if (kDebugMode) {
        print(token);
      }
      return token;
    }
    else{
      return null;
    }
  }
  removeItem()async{
    SharedPreferences removePref = await SharedPreferences.getInstance();
    removePref.remove(key);

  }

}