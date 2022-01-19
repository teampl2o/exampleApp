import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/pages/account_detail_page.dart';
import 'package:banking_app/pages/account_page.dart';
import 'package:banking_app/pages/login_menu_page.dart';
import 'package:banking_app/pages/pin_auth_page.dart';
import 'package:banking_app/pages/scan_qr_page.dart';
import 'package:banking_app/pages/transaction_page.dart';
import 'package:banking_app/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  Route _createRouteAccountDetail() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AccountDetailPage(account: Provider.of<AccountProvider>(context).account),
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

  Route _createRouteChangeMainAccount() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AccountPage(),
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

  Route _createRouteLoginPin() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PinAuthPage(),
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
    List<Widget> listMenu = [
      MenuCard(
        title: "เช็คยอด",
        icon: Icon(
          Icons.account_balance_wallet_outlined,
          color: Colors.blue,
          size: 40,
        ),
        menu: AccountDetailPage(account: Provider.of<AccountProvider>(context).account,),
      ),
      MenuCard(
        title: "โอนเงิน",
        icon: Icon(
          Icons.account_balance,
          color: Colors.blue,
          size: 40,
        ),
        menu: TransferPage(account: Provider.of<AccountProvider>(context).account,),
      ),
      MenuCard(
        title: "สแกน QR",
        icon: Icon(
          Icons.qr_code,
          color: Colors.blue,
          size: 40,
        ),
        menu: ScanQrPage(),
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
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Material(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(40),
                            child: InkWell(
                              customBorder: new CircleBorder(),
                              child: Icon(
                                Icons.view_headline,
                                color: Colors.blue,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
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
                                Icons.logout,
                                color: Colors.blue,
                                size: 25,
                              ),
                              onTap: () {
                                Navigator.of(context).pushReplacement(_createRouteLoginPin());
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(_createRouteAccountDetail());
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          side: BorderSide(color: Colors.blue)),
                      child: SizedBox(
                        width: double.infinity,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "เลขบัญชี",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black
                                                  .withOpacity(0.75)),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          Provider.of<AccountProvider>(context).account["accountId"],
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
                                              color: Colors.black
                                                  .withOpacity(0.75)),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          Provider.of<AccountProvider>(context).account["amount"],
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
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: GestureDetector(
                          child: Text("เปลี่ยนบัญชีหลัก >",
                              style: TextStyle(color: Colors.blue)),
                          onTap: () {
                            Navigator.of(context).push(_createRouteChangeMainAccount());
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "เมนูแบบด่วน",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: listMenu),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "เมนูการเข้าใช้งาน",
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
                          title: "บัญชี",
                          icon: Icon(
                            Icons.credit_card,
                            color: Colors.blue,
                            size: 40,
                          ),
                          menu: AccountPage(),
                        ),
                        MenuCard(
                          title: "ธุรกรรม",
                          icon: Icon(
                            Icons.account_balance,
                            color: Colors.blue,
                            size: 40,
                          ),
                          menu: TransactionPage(),
                        ),
                        MenuCard(
                          title: "การลงทุน",
                          icon: Icon(
                            Icons.work_outline,
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
                          title: "ประกันภัย",
                          icon: Icon(
                            Icons.admin_panel_settings_outlined,
                            color: Colors.blue,
                            size: 40,
                          ),
                          menu: AccountPage(),
                        ),
                        MenuCard(
                          title: "บริการสินเชื่อ",
                          icon: Icon(
                            Icons.monetization_on_outlined,
                            color: Colors.blue,
                            size: 40,
                          ),
                          menu: AccountPage(),
                        ),
                        MenuCard(
                          title: "ตั้งค่าบัญชี",
                          icon: Icon(
                            Icons.settings,
                            color: Colors.blue,
                            size: 40,
                          ),
                          menu: AccountPage(),
                        ),
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
