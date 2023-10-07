import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefHelper {
  static late SharedPreferences sharedPref;

  static Future<void> init() async{
    sharedPref =await SharedPreferences.getInstance();
  }

  static Future<void> setLanguage(bool arabic) async{
    await sharedPref.setBool('_isArabic', arabic);

  }

  static bool? getLanguage(){
    final bool? isArabic=sharedPref.getBool('_isArabic');

    if(isArabic!){
      return isArabic;
    }else {
      return isArabic==false;
    }
  }
}