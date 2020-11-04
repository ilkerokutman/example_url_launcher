library prefs;

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  static bool _initCalled = false;

  static void init() async {
    _initCalled = true;
    _prefsInstance = await _prefs;
  }

  static void dispose() {
    _prefs = null;
    _prefsInstance = null;
  }

  static Set<String> getKeys() {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getKeys();
  }

  static Future<Set<String>> getKeysF() async {
    Set<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getKeys() ?? Set();
    } else {
      value = getKeys();
    }
    return value;
  }

  static dynamic get(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.get(key);
  }

  static Future<dynamic> getF(String key) async {
    dynamic value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.get(key);
    } else {
      value = get(key);
    }
    return value;
  }

  static bool getBool(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getBool(key) ?? false;
  }

  static Future<bool> getBoolF(String key) async {
    bool value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getBool(key) ?? false;
    } else {
      value = getBool(key);
    }
    return value;
  }

  static int getInt(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getInt(key) ?? 0;
  }

  static Future<int> getIntF(String key) async {
    int value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getInt(key) ?? 0;
    } else {
      value = getInt(key);
    }
    return value;
  }

  static double getDouble(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getDouble(key) ?? 0.0;
  }

  static Future<double> getDoubleF(String key) async {
    double value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getDouble(key) ?? 0.0;
    } else {
      value = getDouble(key);
    }
    return value;
  }

  static String getString(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getString(key) ?? '';
  }

  static Future<String> getStringF(String key) async {
    String value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getString(key) ?? '';
    } else {
      value = getString(key);
    }
    return value;
  }

  static List<String> getStringList(String key) {
    assert(_initCalled,
        "Prefs.init() must be called first in an initState() preferably!");
    assert(_prefsInstance != null,
        "Maybe call Prefs.getKeysF() instead. SharedPreferences not ready yet!");
    return _prefsInstance.getStringList(key) ?? [''];
  }

  static Future<List<String>> getStringListF(String key) async {
    List<String> value;
    if (_prefsInstance == null) {
      var instance = await _prefs;
      value = instance.getStringList(key) ?? [''];
    } else {
      value = getStringList(key);
    }
    return value;
  }

  static Future<bool> setBool(String key, bool value) async {
    var instance = await _prefs;
    return instance.setBool(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    var instance = await _prefs;
    return instance.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) async {
    var instance = await _prefs;
    return instance.setDouble(key, value);
  }

  static Future<bool> setString(String key, String value) async {
    var instance = await _prefs;
    return instance.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    var instance = await _prefs;
    return instance.setStringList(key, value);
  }

  static Future<bool> remove(String key) async {
    var instance = await _prefs;
    return instance.remove(key);
  }

  static Future<bool> clear() async {
    var instance = await _prefs;
    return instance.clear();
  }
}
