import 'package:banking_app/pages/login_account_page.dart';
import 'package:flutter/material.dart';

class LoginMenuPage extends StatefulWidget {
  LoginMenuPage();

  @override
  _LoginMenuPageState createState() => _LoginMenuPageState();
}

class _LoginMenuPageState extends State<LoginMenuPage> {

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginAccountPage(),
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
              Text("เลือกวิธีการเข้าใช้งาน",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute());
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        side: BorderSide(color: Colors.blue)),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('รหัสประจำตัว',
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.w700,color: Colors.black87)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('ใช้รหัสประจำตัวที่ได้รับทาง SMS หรือรหัสประจำตัวของแอพธนาคาร',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue  ,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        side: BorderSide(color: Colors.blue)),
                    child: SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.credit_card,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('บัตรเดบิต',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w700,color: Colors.black87)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('ใช้ข้อมูลบัตรเดบิต',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue  ,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        side: BorderSide(color: Colors.blue)),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.account_balance,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('บัญชีเงินฝาก',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w700,color: Colors.black87)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('ใช้ข้อมูลบัญชีสะสมทรัพย์หรือกระแสรายวัน',
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black54)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.blue  ,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    )),
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
    );
  }
}
