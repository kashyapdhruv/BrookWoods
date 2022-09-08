import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  var email;
  bool _obscuretext = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() == confirmpassController.text.trim()) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueGrey.shade300,
        content: Text(
          "Password Did'nt match",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 700),
      ));
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/fur1.jpg",
            ),
            fit: BoxFit.fitHeight,
            alignment: Alignment(0, 0),
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Stack(children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    top: 50,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Create \nAccount",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.brown.shade100,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 20, top: 40),
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //         image: DecorationImage(
                //             scale: 3,
                //             colorFilter: ColorFilter.mode(
                //                 Colors.brown.shade100, BlendMode.srcATop),
                //             image: AssetImage('assets/form.png'),
                //             alignment: Alignment.topLeft)),
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3,
                      left: 30,
                      right: 30),
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: [
                      TextFormField(
                        cursorColor: Colors.grey.shade200,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                              borderRadius: BorderRadius.circular(25)),
                          labelStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          hintText: "Enter Email",
                          labelText: "Email",
                          fillColor: Colors.white38,
                          suffixIcon: Icon(
                            CupertinoIcons.mail,
                            color: Colors.grey.shade300,
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is required";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        cursorColor: Colors.grey.shade200,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        obscureText: _obscuretext,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                              borderRadius: BorderRadius.circular(25)),
                          labelStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                          hintText: "Enter Password",
                          labelText: "Password",
                          fillColor: Colors.white38,
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(25)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {});
                              _obscuretext = !_obscuretext;
                            },
                            child: Icon(
                              _obscuretext
                                  ? CupertinoIcons.eye_fill
                                  : CupertinoIcons.eye_slash_fill,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.trim().length < 6) {
                            return 'Password must be at least 8 characters in length';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                          cursorColor: Colors.grey.shade200,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: confirmpassController,
                          obscureText: _obscuretext,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(25)),
                            labelStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                            hintText: "Enter Password",
                            labelText: "Confirm Password",
                            fillColor: Colors.white38,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(25)),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {});
                                _obscuretext = !_obscuretext;
                              },
                              child: Icon(
                                _obscuretext
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,
                                color: Colors.grey.shade200,
                              ),
                            ),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter Something'),
                          ])),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 95),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.brown.shade100,
                              onPrimary: Colors.black87,
                              shadowColor: Colors.brown.shade600,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              minimumSize: Size(300, 50),
                            ),
                            onPressed: () async {
                              try {
                                if (passwordConfirmed()) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      });
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password:
                                      passwordController.text.trim());
                                  Navigator.pushReplacementNamed(
                                      context, "/nav");
                                }
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.blueGrey.shade300,
                                  content: Text(
                                    e.toString(),
                                    style:
                                    TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  duration: Duration(seconds: 1),
                                  behavior: SnackBarBehavior.floating,
                                ));
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}