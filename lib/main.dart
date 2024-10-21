import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/config/themes.dart' as themes;
import 'package:screl/di/service_locator.dart' as di;
import 'package:screl/views/create_campaign_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  di.inject(sharedPreferences);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'SCREL',
        theme: themes.lightTheme,
        home: const CreateCampaignScreen(),
      ),
    );
  }
}
