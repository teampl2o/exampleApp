import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/pages/account_detail_page.dart';
import 'package:banking_app/pages/account_page.dart';
import 'package:banking_app/pages/login_menu_page.dart';
import 'package:banking_app/pages/scan_qr_page.dart';
import 'package:banking_app/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _pageController =
      PageController(viewportFraction: 0.9, initialPage: 0, keepPage: false);
  int keepIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map> listAccount = [
      {'accountId': '100-4-56865-1', 'amount': '56,003.50'},
      {'accountId': '100-2-33932-6', 'amount': '400,000.20'}
    ];

    List<Widget> listMenu = [
      MenuCard(
        title: "เช็คยอด",
        icon: Icon(
          Icons.account_balance_wallet_outlined,
          color: Colors.blue,
          size: 40,
        ),
        menu: AccountPage(),
      ),
      MenuCard(
        title: "โอนเงิน",
        icon: Icon(
          Icons.account_balance,
          color: Colors.blue,
          size: 40,
        ),
        menu: AccountPage(),
      ),
      MenuCard(
        title: "สแกน QR",
        icon: Icon(
          Icons.qr_code,
          color: Colors.blue,
          size: 40,
        ),
        menu: AccountPage(),
      ),
      MenuCard(
        title: "จ่ายบิล",
        icon: Icon(
          Icons.article_outlined,
          color: Colors.blue,
          size: 40,
        ),
        menu: AccountPage(),
      ),
    ];
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'หน้าหลัก',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.credit_card),
      //       label: 'บัญชี',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.view_headline),
      //       label: 'ตั้งค่า',
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Text(
                                "ย้อนกลับ",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: PageView.builder(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: listAccount.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1.5, color: Colors.blue.shade300),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    "บัญชีออมทรัพย์",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "เลขบัญชี",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                Colors.black.withOpacity(0.75)),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            listAccount[index]["accountId"],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            "ยอดเงินที่ใช้ได้",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                Colors.black.withOpacity(0.75)),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            listAccount[index]["amount"],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black87),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    onPageChanged: (index) {
                      setState(() {
                        setState(() {
                          keepIndex = index;
                        });
                        print(index);
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      "ประเภทธุกรรม",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MenuCard(
                        title: "โอนเงิน",
                        icon: Icon(
                          Icons.account_balance,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: TransferPage(account : listAccount[keepIndex]),
                      ),
                      MenuCard(
                        title: "จ่ายบิล",
                        icon: Icon(
                          Icons.article_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      ),
                      MenuCard(
                        title: "ชำระเงินด้วย QR",
                        icon: Icon(
                          Icons.qr_code_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: ScanQrPage(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MenuCard(
                        title: "เติมเงิน",
                        icon: Icon(
                          Icons.phone_android,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      ),
                      MenuCard(
                        title: "ถอนเงินไม่ใช้บัตร",
                        icon: Icon(
                          Icons.atm,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      ),
                      MenuCard(
                        title: "โอนเงินต่างประเทศ",
                        icon: Icon(
                          Icons.airplanemode_on,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MenuCard(
                        title: "โอนเงินหลายรายการ",
                        icon: Icon(
                          Icons.payments_outlined,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      ),
                      MenuCard(
                        title: "จัดการเช็ค",
                        icon: Icon(
                          Icons.assignment_turned_in_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        menu: AccountPage(),
                      )
                    ],
                  )
                ],
              )
              // Expanded(
              //   child: GridView.count(
              //       // Create a grid with 2 columns. If you change the scrollDirection to
              //       // horizontal, this produces 2 rows.
              //       crossAxisCount: 3,
              //       // Generate 100 widgets that display their index in the List.
              //       children: listMenu),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  final String title;
  final Icon icon;
  final Widget menu;

  const MenuCard(
      {Key? key, required this.title, required this.icon, required this.menu})
      : super(key: key);

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget.menu,
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
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.015,
          horizontal: MediaQuery.of(context).size.width * 0.025),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black.withOpacity(0.05),
        ),
        child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                side: BorderSide(color: Colors.transparent)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height * 0.13,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(child: widget.icon),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
