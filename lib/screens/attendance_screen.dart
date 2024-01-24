import 'dart:js_util';

import 'package:employee_attendance/models/user_model.dart';
import 'package:employee_attendance/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class AttentionScreen extends StatefulWidget {
  const AttentionScreen({super.key});

  @override
  State<AttentionScreen> createState() => _AttentionScreenState();
}

class _AttentionScreenState extends State<AttentionScreen> {
  final GlobalKey<SlideActionState> key = GlobalKey<SlideActionState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(top: 32),
            child: const Text(
              "welcome",
              style: TextStyle(color: Colors.black54, fontSize: 30),
            ),
          ),
          Consumer<DbSevice>(builder: (context, dbService, child) {
            return FutureBuilder(
                future: dbService.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data!;
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        user.name != '' ? user.name : "#${user.employeeId}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    );
                  }

                  return const SizedBox(
                      width: 60, child: LinearProgressIndicator());
                });
          }),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Employee ",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "Today ",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            height: 150,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black26, offset: Offset(2, 2))
                ],
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "check in",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 80,
                      child: Divider(),
                    ),
                    Text(
                      "09:0",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "check in",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 80,
                      child: Divider(),
                    ),
                    Text(
                      "09:0",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "check in",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      width: 80,
                      child: Divider(),
                    ),
                    Text(
                      "09:0",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                )),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "15 aprial ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "20:00",
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Builder(builder: (context) {
              return SlideAction(
                  text: "slide to check out",
                  textStyle: TextStyle(color: Colors.white),
                  innerColor: Colors.redAccent,
                  key: key,
                  onSubmit: () {
                    key.currentState!.reset();
                  });
            }),
          ),
        ],
      ),
    ));
  }
}
