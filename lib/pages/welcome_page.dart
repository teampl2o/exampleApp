import 'package:banking_app/business/local_auth.dart';
import 'package:banking_app/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'login_menu_page.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Route _createRoute() {
    return PageRouteBuilder(
      // pageBuilder: (context, animation, secondaryAnimation) => LoginMenuPage(),
      pageBuilder: (context, animation, secondaryAnimation) => MenuPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Text("Banking app",
                    style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final isAvailable = await LocalAuthApi.hasBiometrics();
                    final biometrics = await LocalAuthApi.getBiometrics();

                    final hasFingerprint = biometrics.contains(BiometricType.fingerprint);
                    final isAuthenticated = await LocalAuthApi.authenticate();
                    if (isAuthenticated) {
                      Navigator.of(context).push(_createRoute());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  child: SizedBox(
                    width: 150,
                    height: 60,
                    child: Center(
                        child: Text('เข้าใช้งาน',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

