import 'package:banking_app/business/local_auth.dart';
import 'package:banking_app/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'login_menu_page.dart';

class PinAuthPage extends StatefulWidget {
  @override
  _PinAuthPageState createState() => _PinAuthPageState();
}

class _PinAuthPageState extends State<PinAuthPage> {
  String pin = "";

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

  void addPin(String num){
    if(pin.length == 5){
      setState(() {
        pin += num;
      });
      Navigator.of(context).pushReplacement(_createRoute());
    }else if(pin.length < 5){
      setState(() {
        pin += num;
      });
    }
    print(pin);
  }

  void deletePin(){
    if(pin.length > 0){
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  Future<void> fingerPrint() async {
    final isAvailable = await LocalAuthApi.hasBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();

    final hasFingerprint = biometrics.contains(BiometricType.fingerprint);
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      Navigator.of(context).pushReplacement(_createRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Banking app",
              style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          SizedBox(
            height: 20,
          ),
          Text("กรอกรหัสผ่าน",
              style: TextStyle(
                  fontSize: 20, color: Colors.black.withOpacity(0.85))),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.blue, width: 1),
                    color: pin.length > 0 ? Colors.blue :Colors.transparent
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.blue, width: 1),
                      color: pin.length > 1 ? Colors.blue :Colors.transparent
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.blue, width: 1),
                      color: pin.length > 2 ? Colors.blue :Colors.transparent
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.blue, width: 1),
                      color: pin.length > 3 ? Colors.blue :Colors.transparent
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.blue, width: 1),
                      color: pin.length > 4? Colors.blue :Colors.transparent
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.blue, width: 1),
                      color: pin.length > 5 ? Colors.blue :Colors.transparent
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("1");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("2");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("3");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
            ],
          ),Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("4");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "4",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("5");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("6");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "6",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("7");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "7",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("8");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "8",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("9");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "9",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      deletePin();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent),),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "ลบ",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      addPin("0");
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Text(
                          "0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black87),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0),
                child: OutlinedButton(
                    onPressed: () {
                      fingerPrint();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: CircleBorder(),
                        side: BorderSide(color: Colors.transparent)),
                    child: SizedBox(
                      width: 75,
                      height: 75,
                      child: Center(
                        child: Image.asset("assets/fingerprint.png",height:50 ,color: Colors.blue,)
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    )));
  }
}
