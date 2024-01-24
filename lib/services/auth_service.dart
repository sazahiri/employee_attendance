import 'package:employee_attendance/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'db_service.dart';

class AuthService extends ChangeNotifier {
  final DbSevice _dbSevice = DbSevice();
  final SupabaseClient _supabase = Supabase.instance.client;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registerEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == "" || password == "") {
        throw ("all field is req");
      }
      final AuthResponse response =
          await _supabase.auth.signUp(email: email, password: password);
      if (response != null) {
        await _dbSevice.insertNewUser(email, response.user!.id);
        Utils.showSnakBar("reg success!", context, color: Colors.green);
        await loginEmployee(email, password, context);
        Navigator.pop(context);
      }
    } catch (e) {
      setIsLoading = false;
      Utils.showSnakBar(e.toString(), context, color: Colors.red);
    }
  }

  Future loginEmployee(
      String email, String password, BuildContext context) async {
    try {
      setIsLoading = true;
      if (email == "" || password == "") {
        throw ("all field is req");
      }
      final AuthResponse response = await _supabase.auth
          .signInWithPassword(email: email, password: password);

      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      Utils.showSnakBar(e.toString(), context, color: Colors.red);
    }
  }

  Future signOut() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }

  User? get currentUser => _supabase.auth.currentUser;
}
