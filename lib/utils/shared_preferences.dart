import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;


setGlobalKey(  {String? globalKey} ) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('globalKey', globalKey ?? "");
}
getGlobalKey() async{
  prefs = await SharedPreferences.getInstance();
  return prefs.getString('globalKey');
}


setGlobalLanguage( String userLanguage) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLanguage', userLanguage);
}

void cleanDelete() async {
  prefs = await SharedPreferences.getInstance();
  prefs.remove("globalKey");
  prefs.remove("userLanguage");
}
