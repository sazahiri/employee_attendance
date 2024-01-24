import 'package:employee_attendance/screens/home_screen.dart';
import 'package:employee_attendance/screens/login_screen.dart';
import 'package:employee_attendance/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    //authService.signOut();

    return authService.currentUser == null
        ? const LoginScreen()
        : const HomeScreen();
  }
}
