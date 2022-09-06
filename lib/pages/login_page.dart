import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sizer/sizer.dart';
import 'Navbar/nav_bar.dart';

class MyLogin extends StatefulWidget {
  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final storage = FlutterSecureStorage();

  var email;

  bool _obscuretext = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  final formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fur1.jpg"),
                fit: BoxFit.cover,
                colorFilter:
                ColorFilter.mode(Colors.black45, BlendMode.darken))),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Brookwoods.png'),
                          alignment: Alignment.topCenter)),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.57,
                      right: 30,
                      left: 30),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,

                          // onEditingComplete: () =>
                          //     FocusScope.of(context).nextFocus(),
                          cursorColor: Colors.grey.shade200,
                          controller: emailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(25)),
                              labelStyle: TextStyle(
                                  color: Colors.grey.shade200,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                              hintText: "Enter Email",
                              labelText: "Email",
                              fillColor: Colors.white38,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              suffixIcon: Icon(
                                CupertinoIcons.mail_solid,
                                color: Colors.grey.shade200,
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value;
                          },

                          // MultiValidator([
                          //   RequiredValidator(
                          //       errorText: 'should not be Empty'),
                          //   EmailValidator(errorText: 'Enter a Valid Email')
                          // ])
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          // onEditingComplete: () =>
                          //     FocusScope.of(context).nextFocus(),
                          autocorrect: true,
                          cursorColor: Colors.grey.shade200,
                          controller: passwordController,
                          obscureText: _obscuretext,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                                borderRadius: BorderRadius.circular(25)),
                            labelStyle: TextStyle(
                                color: Colors.grey.shade100,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                            hintText: "Enter Password",
                            labelText: "Password",
                            fillColor: Colors.white38,
                            filled: true,
                            border: OutlineInputBorder(
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
                            } else if (value.trim().length < 6) {
                              return 'Password must be at least 8 characters in length';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 100),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey.shade300,
                                onPrimary: Colors.black,
                                shadowColor: Colors.grey.shade600,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                minimumSize: Size(300, 50),
                              ),
                              onPressed: () async {
                                try {
                                  UserCredential userCredential =
                                  await FirebaseAuth
                                      .instance
                                      .signInWithEmailAndPassword(
                                      email:
                                      emailController.text.trim(),
                                      password: passwordController.text
                                          .trim());
                                  await storage.write(
                                      key: "email",
                                      value: userCredential.user?.uid);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavPage(),
                                      ));
                                } on FirebaseAuthException catch (e) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.blueGrey.shade300,
                                    content: Text(
                                      e.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    duration: Duration(seconds: 3),
                                    behavior: SnackBarBehavior.floating,
                                  ));

                                  // Fluttertoast.showToast(
                                  //     msg: e.toString(),
                                  //     gravity: ToastGravity.BOTTOM);
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/register");
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.grey.shade300),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.grey.shade300)),
                                  ),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/reset");
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.grey.shade300),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.grey.shade300)),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}