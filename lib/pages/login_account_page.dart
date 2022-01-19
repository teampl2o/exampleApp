import 'package:flutter/material.dart';

import 'menu_page.dart';

class LoginAccountPage extends StatefulWidget {
  LoginAccountPage();

  @override
  _LoginAccountPageState createState() => _LoginAccountPageState();
}

class _LoginAccountPageState extends State<LoginAccountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _accountId = "";
  String _password = "";

  Route _createRoute() {
    return PageRouteBuilder(
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

  void validateData() {
    if (_formKey.currentState!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                        customBorder: new CircleBorder(),
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.blue,
                          size: 40,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("ระบุรหัสประจำตัว/รหัสลับส่วนตัว",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'รหัสประจำตัวจากข้อความ SMS / รหัสบัญชี',
                          labelText: 'รหัสประจำตัว',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onSaved: (value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        onChanged: (value) {
                          validateData();
                        },
                        validator: (value) {
                          return value!.isEmpty ? 'โปรดระบุ User ID' : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText:
                              'รหัสลับแรกเข้า 6 หลัก / รหัสลับส่วนตัวบัญชี',
                          labelText: 'รหัสลับแรกเข้า / รหัสส่วนตัว',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                        onSaved: (value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        onChanged: (value) {
                          validateData();
                        },
                        validator: (value) {
                          return value!.isEmpty
                              ? 'โปรดระบุ PIN/Password'
                              : null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  validateData();
                  Navigator.of(context).push(_createRoute());
                },
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: Center(
                      child: Text('ต่อไป',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "ลงทะเบียน",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
