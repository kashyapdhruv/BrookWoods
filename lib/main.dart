import 'package:catalog_app/pages/Navbar/cart_page/cart_provider.dart';
import 'package:catalog_app/pages/Navbar/nav_bar.dart';
import 'package:catalog_app/pages/Navbar/profile_page.dart';
import 'package:catalog_app/pages/animated_page.dart';
import 'package:catalog_app/pages/home_page/data/home_data.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/pages/pass_reset.dart';
import 'package:catalog_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final storage = FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    } else
      return true;
  };


  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Models()),
          ChangeNotifierProvider(create: (BuildContext context) => Cart()),
        ],
      child: MaterialApp(
        title: 'BrookWoods',
        debugShowCheckedModeBanner: false,
        initialRoute: '/Animated',
        routes: {
          '/reset' : (context) => ForgotPassword(),
          '/Animated': (context) => AnimatedPage(),
          '/Profile': (context) => Profile(),
          '/home': (context) => MyLogin(),
          '/register': (context) => MyRegister(),
          '/nav': (context) => NavPage(),
        },
        home: FutureBuilder(
            future: checkLoginStatus(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data == false) {
                return MyLogin();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                    color: Colors.white,
                    child: Center(child: CircularProgressIndicator()));
              }
              return NavPage();
            }),
      ),
    )
  );
}