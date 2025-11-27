
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionService {
  static const _key = "plankey";

  Future<String?> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  Future<void> save(String plan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, plan);
  }

  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}