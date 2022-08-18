import 'package:catalog_app/pages/Navbar/nav_bar.dart';
import 'package:catalog_app/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:catalog_app/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/nav',
        routes: {
          '/home': (context)=> MyLogin(),
           '/register': (context)=> MyRegister(),
          '/nav': (context)=> NavPage(),


        },

        home: AnimatedSplashScreen(splash: Image.asset('assets/grocery.png'),
          disableNavigation: false,
          nextScreen: MyLogin(),
          splashIconSize: 250,
          backgroundColor: Colors.indigo.shade700,splashTransition: SplashTransition.slideTransition,
        animationDuration: Duration(seconds:2),curve:Curves.bounceOut,
          duration: 1500,),

  ));

}
class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NavPage();
        }
        else {
          return MyLogin();
        }
      },
    )
  );
}

