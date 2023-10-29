import 'package:shared_preferences/shared_preferences.dart';

class Cash {
  static SharedPreferences? prefs;
  // Obtain shared preferences.
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setDateToShared(
      {required String keyofsetDateToShared,
      required bool valueofsetDateToShared}) async {
    await prefs!.setBool(keyofsetDateToShared, valueofsetDateToShared);
  }

  static Future getDateFromShared(
      {required String keyofsetDateToShared}) async {
    return prefs!.getBool(keyofsetDateToShared);
  }
}
