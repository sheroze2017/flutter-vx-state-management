import 'package:flutter/material.dart';
import 'package:practise1/pages/sign_up.dart';
import 'package:practise1/pages/login_page.dart';
import 'package:practise1/util/route.dart';
import 'package:flutter/material.dart';
import 'package:practise1/pages/home.dart';
import 'package:practise1/pages/sign_up.dart';
import 'package:practise1/util/route.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String name = "";
  bool changeBtn = false;
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/hey.png",
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "Welcome $name",
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              hintText: "Enter username",
                              labelText: "Username"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "username  cant be empty";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "password  cant be empty";
                            } else if (value.length < 6) {
                              return "password length should be atlest 6";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                        //   },
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        // )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Material(
                  child: InkWell(
                    onTap: () => SignUp(),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeBtn ? 60 : 150,
                      height: 60,
                      alignment: Alignment.center,
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(changeBtn ? 50 : 0),
                      ),
                    ),
                  ),
                ),
                Material(
                  child: Column(
                    children: [
                      SignInButtonBuilder(
                        text: 'Sign in with Email',
                        icon: Icons.email,
                        onPressed: () {},
                        backgroundColor: Colors.blueGrey[700]!,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
