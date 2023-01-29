// import 'package:shared_preferences/shared_preferences.dart';

// class ZappSharedPrefs {
//   static late final SharedPreferences sharedPrefs;
//   ZappSharedPrefs._() {
//     init();
//   }

//   void init() async {
//     sharedPrefs = await SharedPreferences.getInstance();
//   }

//   static const String DARK_MODE_KEY = 'app_dark_mode_state';

//   static void setDarkModeValue(bool val) =>
//       sharedPrefs.setBool(DARK_MODE_KEY, val);

//   static bool getDarkModeValue() => sharedPrefs.get(DARK_MODE_KEY) ?? false;
// }
