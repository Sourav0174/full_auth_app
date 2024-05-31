import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Email send", style: TextStyle(fontSize: 22))));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User not found", style: TextStyle(fontSize: 22))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Password Recovery",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Enter your Email",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 80,
              ),
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                  controller: emailController,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    labelText: "Enter Your Email",
                    suffixIcon: const Icon(Icons.mail),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 104, 104, 104)),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 104, 104, 104)),
                        borderRadius: BorderRadius.circular(25)),
                  )),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor:
                            const Color.fromARGB(255, 166, 17, 193),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                          });
                        }
                        resetPassword();
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
