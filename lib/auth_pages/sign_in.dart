import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_auth_app/auth_pages/forgot_password.dart';
import 'package:full_auth_app/auth_pages/services/auth.dart';
import 'package:full_auth_app/auth_pages/sign_up.dart';
import 'package:full_auth_app/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();

  String email = "", password = "", name = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  userLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Registration Successful! Please login Now",
          style: TextStyle(fontSize: 22),
        )));
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const HomePage())));
      } on FirebaseAuthException catch (e) {
        String errorMessage;
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;
          case 'wrong-password':
            errorMessage = 'The password is wrong.';
            break;
          default:
            errorMessage = 'An unknown error occurred.';
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.yellow,
            content: Text(
              errorMessage,
              style: TextStyle(color: Colors.black, fontSize: 22),
            )));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text(
            "Please fill all fields",
            style: TextStyle(fontSize: 22, color: Colors.black),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: h * 0.25,
                    child: Center(
                      child: Image.asset(
                        "assets/images/1_sign_up_logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
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
                  SizedBox(
                    height: h * 0.025,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password can not be";
                        }
                        return null;
                      },
                      controller: passwordController,
                      enableSuggestions: true,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter Your Password",
                        suffixIcon: const Icon(Icons.password),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 104, 104, 104)),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 104, 104, 104)),
                            borderRadius: BorderRadius.circular(25)),
                      )),
                  SizedBox(
                    height: h * 0.06,
                  ),
                  SizedBox(
                      height: 60,
                      width: w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor:
                                  const Color.fromARGB(255, 166, 17, 193)),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                name = nameController.text;
                                email = emailController.text;
                                password = passwordController.text;
                              });
                            }
                            userLogin();
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ))),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword())),
                    child: const Text(
                      "forgot password!",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 70, 70, 70)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  const Text(
                    "or sign in using",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 90, 1, 92)),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: GestureDetector(
                          onTap: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          child: Image.asset(
                            "assets/images/2_google_logo.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: GestureDetector(
                          onTap: () {
                            AuthMethods().signInWithApple();
                          },
                          child: Image.asset(
                            "assets/images/3_apple_logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ! ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 70, 70, 70),
                            fontSize: 17),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 166, 17, 193),
                              fontSize: 22),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
