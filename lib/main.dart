import 'package:flutter/material.dart';
import 'package:synkrama_test/shared_preference.dart';

import 'dashboard.dart';
import 'homePage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();
var token = await sharedPreferenceClass.getItem();
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: token != null ? Dashboard() : HomePage(),
  ));
}