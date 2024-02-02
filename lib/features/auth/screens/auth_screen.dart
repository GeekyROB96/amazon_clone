// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  AuthService authService = AuthService();

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _signupEmailController = TextEditingController();
  final TextEditingController _signupPasswordController =
      TextEditingController();
  final TextEditingController _signupNameController = TextEditingController();

  final TextEditingController _signinEmailController = TextEditingController();
  final TextEditingController _signinPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _signupEmailController.dispose();
    _signupNameController.dispose();
    _signupPasswordController.dispose();

    _signinEmailController.dispose();
    _signinPasswordController.dispose();
  }

  void signUpUser() {
    authService.signupUser(
      context: context,
      email: _signupEmailController.text,
      password: _signupPasswordController.text,
      name: _signupNameController.text,
    );
  }

  void signInUser() {
    authService.signinUser(
        context: context,
        email: _signinEmailController.text,
        password: _signinPasswordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _signupNameController,
                            hintText: "Name"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _signupEmailController,
                            hintText: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _signupPasswordController,
                            hintText: "Password"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                            text: 'SignUp',
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _signinEmailController,
                            hintText: "Email"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _signinPasswordController,
                            hintText: "Password"),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(text: 'SignIn', onTap: () {
                           if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                        }),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
