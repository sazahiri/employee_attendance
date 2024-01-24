import 'package:employee_attendance/screens/register_screen.dart';
import 'package:employee_attendance/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double? screenHeight2 = screenHeight / 10;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              height: screenHeight / 3,
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("data",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              )),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                      label: Text("Empl"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                  controller: _emailcontroller,
                ),
                const SizedBox(height: 30),
                TextField(
                  decoration: const InputDecoration(
                      label: Text(
                        "password",
                      ),
                      prefixIcon: Icon(Icons.lock),
                      prefixIconConstraints: BoxConstraints(maxHeight: 30),
                      border: OutlineInputBorder()),
                  controller: _passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 30),
                Consumer<AuthService>(
                    builder: (context, AuthServiceProvider, child) {
                  return SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: AuthServiceProvider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              AuthServiceProvider.loginEmployee(
                                  _emailcontroller.text,
                                  _passwordController.text.trim(),
                                  context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: const Text("Are you new Employer ? register here"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
