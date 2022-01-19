import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/widget/account_card_widget.dart';
import 'package:banking_app/widget/main_account_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountFavoritePage extends StatefulWidget {
  const AccountFavoritePage({Key? key}) : super(key: key);

  @override
  _AccountFavoritePageState createState() => _AccountFavoritePageState();
}

class _AccountFavoritePageState extends State<AccountFavoritePage> {
  final TextEditingController _accountFavoriteController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                          "เลือกรายการบัญชีโปรด",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: TextField(
                      controller: _accountFavoriteController,
                      decoration: const InputDecoration(
                        labelText: 'ค้นหา',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Container(
                      color: Colors.blue.withOpacity(0.08),
                      child: ListView(
                        children: <Widget>[
                          InkWell(
                            onTap: (){Navigator.pop(
                                context, {"bankName": "ธนาคารไทยพานิชย์ จำกัด", "bankIcon": "scb","accountId":"120-2-03393-1"});},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0
                                      )
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/scb_logo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("จีรศักดิ์ SSCS",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.w600)),
                                        Text("ธนาคารไทยพานิชย์ จำกัด",
                                            style: TextStyle(
                                                fontSize: 14,)),
                                        Text("120-2-03393-1",
                                            style: TextStyle(
                                              fontSize: 14,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){Navigator.pop(
                                context, {"bankName": "ธนาคารออมสิน", "bankIcon": "gsb","accountId":"400-2-45333-7"});},
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black54,
                                          width: 1.0
                                      )
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/gsb_logo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 40,
                                      height: 40,
                                    ),
                                    SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("ธนากร SSCS",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.w600)),
                                        Text("ธนาคารออมสิน",
                                            style: TextStyle(
                                              fontSize: 14,)),
                                        Text("400-2-45333-7",
                                            style: TextStyle(
                                              fontSize: 14,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }
}
