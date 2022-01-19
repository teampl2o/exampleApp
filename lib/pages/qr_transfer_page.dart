import 'package:banking_app/business/account_provider.dart';
import 'package:banking_app/pages/account_favorite_page.dart';
import 'package:banking_app/pages/transfer_confirm_page.dart';
import 'package:banking_app/widget/account_card_widget.dart';
import 'package:banking_app/widget/main_account_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QrTransferPage extends StatefulWidget {
  final Map toAccount;

  const QrTransferPage({Key? key, required this.toAccount}) : super(key: key);

  @override
  _QrTransferPageState createState() => _QrTransferPageState();
}

class _QrTransferPageState extends State<QrTransferPage> {
  final _pageController =
  PageController(viewportFraction: 0.9, initialPage: 0, keepPage: false);
  int keepIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _bankNameController = new TextEditingController();
  TextEditingController _accountIdController =
      new TextEditingController();
  TextEditingController _amountController =
  new TextEditingController();
  String bankIcon = "";
  bool amountReadOnly = false;

  Route _createRoute(Map account) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          TransferConfirmPage(
        account: account,
        toAccount: {
          "bankName": widget.toAccount["bankName"],
          "accountId": widget.toAccount["accountId"],
          "amount":widget.toAccount["amount"],
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

  void setBankIcon(){
    switch (widget.toAccount["bankId"]){
      case "001" :
        {
          bankIcon = "gsb";
        }
        break;
      case "002" :
        {
          bankIcon = "scb";
        }
        break;
    }
  }

  bool validateData() {
    if (_formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setBankIcon();
    _bankNameController.text = widget.toAccount["bankName"];
    _accountIdController.text = widget.toAccount["accountId"];
    _amountController.text = widget.toAccount["amount"];
    amountReadOnly = (widget.toAccount["amount"] != "" && widget.toAccount["amount"] !=null);
  }

  void unFocusKeyboard(){
    FocusScopeNode currentFocus =
    FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map> listAccount = [
      {'accountId': '100-4-56865-1', 'amount': '56,003.50'},
      {'accountId': '100-2-33932-6', 'amount': '400,000.20'}
    ];

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
                                unFocusKeyboard();
                                Navigator.pop(context,{"qrResume":true});
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            unFocusKeyboard();
                            Navigator.pop(context,{"qrResume":true});
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
                                          readOnly: true,
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 35,
                                )
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
                                readOnly: amountReadOnly,
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
                                  print(value);
                                  validateData();
                                  widget.toAccount["amount"] = value;
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
                                unFocusKeyboard();
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
                                await Navigator.of(context)
                                    .push(_createRoute(listAccount[keepIndex]));
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

