import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences{
  static SharedPreferences? _preferences; // _preferences adalah nama variabelnya

  // buat variabel untuk nama dan pin untuk dijadikan key nya di dlm shared preferences nya
  static const String _name = 'name';
  static const String _pin = 'pin';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setName({
    required String name,
    required String pin,
  }) async {
    await _preferences!.setString(_name, name);  // di asyn untuk _name ini di isi sm value nama yang udah diinputin user
    await _preferences!.setString(_pin, pin);
  } 
  // jadi data yang sudah user inputkan akan disimpan disini,
  // kalo apk nya ditutup, lalu berusaha masuk kl datanya dah ada tinggal dicocokkan

  static String? getName() => _preferences!.getString(_name);
  static String? getPin() => _preferences!.getString(_pin);

}