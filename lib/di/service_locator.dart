import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
void inject(SharedPreferences sharedPreferences) {
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}
