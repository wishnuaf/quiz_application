import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _id = 'idUser';

  static void saveId(String id) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_id, id);
    });
  }

  static Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString(_id) ?? '';
    return id;
  }

  static void removeId() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(_id);
    });
  }
}
