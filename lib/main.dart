import 'package:employee_attendance/screens/login_screen.dart';
import 'package:employee_attendance/screens/splash_screen.dart';
import 'package:employee_attendance/services/auth_service.dart';
import 'package:employee_attendance/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await dotenv.load();
  String supaBaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String supaBaseKey = dotenv.env['SUPABASE_KEY'] ?? '';
  await Supabase.initialize(url: supaBaseUrl, anonKey: supaBaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => DbSevice()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SpalshScreen(),
      ),
    );
  }
}
