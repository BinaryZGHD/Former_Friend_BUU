import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;


setGlobalKey(  {String? globalKey} ) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('globalKey', globalKey ?? "");
}
setGlobalLanguage( String userLanguage) async{
  prefs = await SharedPreferences.getInstance();
  await prefs.setString('userLanguage', userLanguage);
}