// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practise1/pages/home.dart';
import 'package:practise1/pages/sign_up.dart';
import 'package:practise1/util/route.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String name = "";
  bool changeBtn = false;
  final _formkey = GlobalKey<FormState>();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email, _password;

  // checkAuthentification() {
  //   _auth.onAuthStateChanged.listen((user) {
  //     // ignore: unnecessary_null_comparison
  //     if (user != null) {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => Homepage()));
  //     }
  //   });
  //   // @override
  //   // dynamic initState() {
  //   //   super.initState();
  //   //   this.checkAuthentification();
  //   // }
  // }

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
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
                              // prefixIcon: (Icon(Icons.email)),
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
                              // prefixIcon: (Icon(Icons.password)),
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

                        Material(
                          child: InkWell(
                            onTap: () => moveToHome(context),
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeBtn ? 60 : 150,
                              height: 60,
                              alignment: Alignment.center,
                              child: changeBtn
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius:
                                    BorderRadius.circular(changeBtn ? 50 : 0),
                              ),
                            ),
                          ),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeBtn ? 60 : 150,
                      height: 60,
                      alignment: Alignment.center,
                      child: Text(
                        "SignUp",
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
              ],
            ),
          ),
        ));
  }
}
