import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/pages/account_favorite_page.dart';
import 'package:banking_app/widget/account_card_widget.dart';
import 'package:banking_app/widget/main_account_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'menu_page.dart';

class TransferCompletePage extends StatefulWidget {
  final Map account;
  final Map toAccount;

  const TransferCompletePage(
      {Key? key, required this.account, required this.toAccount})
      : super(key: key);

  @override
  _TransferCompletePageState createState() => _TransferCompletePageState();
}

class _TransferCompletePageState extends State<TransferCompletePage> with TickerProviderStateMixin{
  DateTime now = DateTime.now();

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MenuPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
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

  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy kk:mm:ss').format(now);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: -2 ,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Icon(Icons.assignment_turned_in_outlined,
                      color: Colors.green ,size:60,),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 70,),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                            "ทำรายการสำเร็จ",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text("จำนวนเงิน (ค่าธรรมเนียม)"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${widget.toAccount["amount"]} ฿",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            Text("(0.00 ฿)",
                                style: TextStyle(fontSize: 14, color: Colors.blue)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/sscs_logo.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width: 70,
                                  height: 70,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.account["accountId"],
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "นายจีรศักดิ์ ติรวงศาโรจน์",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("ยอดเงินคงเหลือก่อนโอน",
                                    style: TextStyle(fontSize: 12)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("${widget.account["amount"]} ฿",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Icon(
                              Icons.arrow_right,
                              color: Colors.blue,
                              size: 50,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${widget.toAccount["bankIcon"]}_logo.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width: 70,
                                  height: 70,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.account["accountId"],
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "นายจันทร์ หนวดเขี้ยว",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 13.0, top: 15, bottom: 5,right: 13),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("รายละเอียดการโอน",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold))),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    color: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "จำนวนเงิน (ค่าธรรมเนียม)",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "${widget.toAccount["amount"]} ฿ (0.00 ฿)",
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    color: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "เลขที่อ้างอิงรายการ",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "NTO313SDF123477734",
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    color: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "วันที่สั่งโอนเงิน",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "$formattedDate",
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    color: Colors.black12,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "วันที่เงินถึงปลายทาง",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Text(
                                                "$formattedDate",
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> route) => false);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      side: BorderSide(color: Colors.blue)),
                                  child: SizedBox(
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                        child: Text(
                                          "เมนูหลัก",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 60,
                                  child: Center(
                                      child: Text('โอนเพิ่ม',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600))),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
