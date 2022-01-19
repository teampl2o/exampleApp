import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/pages/account_favorite_page.dart';
import 'package:banking_app/pages/transfer_confirm_page.dart';
import 'package:banking_app/widget/account_card_widget.dart';
import 'package:banking_app/widget/main_account_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferPage extends StatefulWidget {
  final Map account;

  const TransferPage({Key? key, required this.account}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _bankNameController = new TextEditingController();
  TextEditingController _accountIdController =
      new TextEditingController();
  TextEditingController _amountController =
  new TextEditingController();
  String bankName = "";
  String accountId = "";
  String amount = "";
  String bankIcon = "";

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          TransferConfirmPage(
        account: widget.account,
        toAccount: {
          "bankName": bankName,
          "accountId": accountId,
          "amount": amount,
          "bankIcon": bankIcon
        },
      ),
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

  bool validateData() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  Future _askBank() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new SimpleDialog(
            children: <Widget>[
              new SimpleDialogOption(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/gsb_logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Text('ธนาคารออมสิน', style: TextStyle(fontSize: 18)),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(
                      context, {"bankName": "ธนาคารออมสิน", "bankIcon": "gsb"});
                },
              ),
              new SimpleDialogOption(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/scb_logo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Text(
                      "ธนาคารไทยพานิชย์ จำกัด",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    "bankName": "ธนาคารไทยพานิชย์ จำกัด",
                    "bankIcon": "scb"
                  });
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                Navigator.pop(context,{"qrResume":true});
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
                        "โอนเงิน",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade100,
                    ),
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
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
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        widget.account["accountId"],
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
                                      height: 5,
                                    ),
                                    Container(
                                      child: Text(
                                        widget.account["amount"],
                                        style: TextStyle(
                                            fontSize: 18,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        "ไปยังบัญชี",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: bankIcon == ""
                                                ? Container(
                                                    color: Colors.black54,
                                                    width: 40,
                                                    height: 40,
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/${bankIcon}_logo.png'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    width: 40,
                                                    height: 40,
                                                  ),
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: _bankNameController,
                                              readOnly: true,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.blue),
                                              decoration: const InputDecoration(
                                                hintText: 'กรุณาเลือกธนาคาร',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54),
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54),
                                                ),
                                              ),
                                              onSaved: (value) {},
                                              onChanged: (value) {
                                                validateData();
                                              },
                                              onTap: () async {
                                                final map = await _askBank();
                                                setState(() {
                                                  if (map != null) {
                                                    _bankNameController.text =
                                                        map["bankName"];
                                                    bankName = map["bankName"];
                                                    bankIcon = map["bankIcon"];
                                                  }
                                                  FocusScope.of(context)
                                                      .nextFocus();
                                                });
                                              },
                                              validator: (value) {
                                                return value!.isEmpty
                                                    ? 'โปรดเลือกธนาคาร'
                                                    : null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: _accountIdController,
                                          maxLength: 13,
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.blue),
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText: 'กรอกเลขที่บัญชี',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black54),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black54),
                                            ),
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            // This optional block of code can be used to run
                                            // code when the user saves the form.
                                          },
                                          onChanged: (value) {
                                            validateData();
                                            value = value.replaceAll("-", "");
                                            if (value.length > 9) {
                                              _accountIdController.text =
                                                  "${value.substring(0, 3)}-${value.substring(3, 4)}-${value.substring(4, 9)}-${value.substring(9, value.length)}";
                                            } else if (value.length > 4) {
                                              _accountIdController.text =
                                                  "${value.substring(0, 3)}-${value.substring(3, 4)}-${value.substring(4, value.length)}";
                                            } else if (value.length > 3) {
                                              _accountIdController.text =
                                                  "${value.substring(0, 3)}-${value.substring(3, value.length)}";
                                            } else if (value.length > 0) {
                                              _accountIdController.text =
                                                  "${value.substring(0, value.length)}";
                                            }
                                            accountId =
                                                _accountIdController.text;
                                            _accountIdController.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset:
                                                            _accountIdController
                                                                .text.length));
                                          },
                                          validator: (value) {
                                            return value!.isEmpty
                                                ? 'โปรดกรอกเลขที่บัญชี'
                                                : null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () async {
                                  final map = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AccountFavoritePage()),
                                  );
                                  setState(() {
                                    if (map != null) {
                                      _bankNameController.text =
                                          map["bankName"];
                                      _accountIdController.text =
                                          map["accountId"];
                                      bankIcon = map["bankIcon"];
                                    }
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_box_outlined,
                                    color: Colors.blue,
                                    size: 35,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                "฿",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _amountController,
                                style:
                                    TextStyle(fontSize: 22, color: Colors.blue),
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: 'ระบุจำนวนเงิน',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                  ),
                                ),
                                onSaved: (value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                onChanged: (value) {
                                  validateData();
                                  amount = value;
                                },
                                validator: (value) {
                                  return value!.isEmpty
                                      ? 'โปรดระบุจำนวนเงิน'
                                      : null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "บาท",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
                                Navigator.pop(context,{"qrResume":true});
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
                                      "ยกเลิก",
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
                            onPressed: () async {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);

                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }

                              if (validateData()) {
                                final reSend = await Navigator.of(context)
                                    .push(_createRoute());
                                if (reSend != null) {
                                  _bankNameController.text = "";
                                  _accountIdController.text = "";
                                  _amountController.text = "";
                                  bankName = "";
                                  accountId = "";
                                  amount = "";
                                  bankIcon = "";
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: Center(
                                  child: Text('ตรวจสอบ',
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
      )),
    );
  }
}
