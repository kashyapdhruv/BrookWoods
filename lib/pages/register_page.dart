import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyRegister extends StatefulWidget {
  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  @override
  Widget build(BuildContext context) {
    return Sizer(builder : (context, orientation, deviceType) {
      return  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/login 1.jpg",
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
            body: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only( right: 20,top: 80, ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topRight,
                      child: Text(
                        "Create \nAccount",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white70,
                            fontFamily: 'Lobster'
                        ),
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(scale: 3,
                            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
                            image: AssetImage('assets/form.png'),
                            alignment: Alignment.topLeft
                        )
                    ),
                  ),
                ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.4,
                          left: 30,
                          right: 30),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(25)),
                              labelStyle: TextStyle(
                                color: Colors.grey.shade300,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              hintText: "Enter Username",
                              labelText: "Username",
                              suffixIcon: Icon(
                                CupertinoIcons.profile_circled,
                                color: Colors.grey.shade300,
                              ),
                              fillColor: Colors.white38,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
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
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            obscureText: true,
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
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.eye),
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 95),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black87,
                                  shadowColor: Colors.white70,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  minimumSize: Size(300, 50),
                                ),
                                onPressed: () {},
                                child: Text("Sign Up",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.w500
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

      );

    },
    );
  }
}
