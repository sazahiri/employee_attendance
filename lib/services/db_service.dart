import 'dart:math';

import 'package:employee_attendance/constants/constants.dart';
import 'package:employee_attendance/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DbSevice extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  UserModel? userModel;

  String generateRandomEmployeeId() {
    final random = Random();
    const allChars = "fangGang0123456789";
    final randomString =
        List.generate(8, (index) => allChars[random.nextInt(allChars.length)])
            .join();
    return randomString;
  }

  Future insertNewUser(String email, var id) async {
    await _supabase.from(Constants.employeeTable).insert({
      'id': id,
      'email': email,
      'name': '',
      'department': null,
      'employee_id': generateRandomEmployeeId()
    });
  }

  Future<UserModel> getUserData() async {
    final userData = await _supabase
        .from(Constants.employeeTable)
        .select()
        .eq('id', _supabase.auth.currentUser!.id)
        .single();
    userModel = UserModel.fromJson(userData);
    return userModel!;
  }
}
