import 'package:banking_app/business/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailPage extends StatefulWidget {
  Map account;

  AccountDetailPage({Key? key, required this.account}) : super(key: key);

  @override
  _AccountDetailPageState createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage>
    with TickerProviderStateMixin {

  int indexOfMonth = 7;
  final _pageController =
      PageController(viewportFraction: 0.3, initialPage: 7, keepPage: false);
  bool defualt = false;
  bool setMain = false;
  late AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 0),
    vsync: this,
  )..forward();
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexOfMonth = _pageController.initialPage;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> listMonth = [
      "มกราคม",
      "กุมภาพันธ์",
      "มีนาคม",
      "เมษายน",
      "พฤษภาคม",
      "มิถุนายน",
      "กรกฎาคม",
      "สิงหาคม",
      "กันยายน",
      "ตุลาคม",
      "พฤศจิกายน",
      "ธันวาคม"
    ];
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade100,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 0, left: 5, bottom: 10),
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
                    children: <Widget>[
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 15, right: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "รายละเอียดบัญชี",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
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
                                  Container(
                                    child: Text(
                                      "ประเภทบัญชี",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "ออมทรัพย์",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "ชื่อบัญชี",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "จีรศักดิ์ ติรวงศาโรจน์",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "สถานะบัญชี",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      "ปกติ (Active)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Text(
                                      "สาขา",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Colors.black.withOpacity(0.75)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    child: Flexible(
                                      child: Text(
                                        "สาขาเซนทรัลพลาซ่า แกรนด์พระราม 9",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.75)),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Provider.of<AccountProvider>(context).account["accountId"] ==
                        widget.account["accountId"]
                    ? Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: SizeTransition(
                          sizeFactor: _animation,
                          axis: Axis.horizontal,
                          axisAlignment: -1,
                          child: Row(
                            children: [
                              Icon(Icons.assignment_turned_in_outlined,
                                  color: Colors.green),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "บัญชีหลัก",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                    )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            Provider.of<AccountProvider>(context, listen: false)
                                .selectMainAccount(widget.account);
                            setState(() {
                              _controller = AnimationController(
                                duration: const Duration(seconds: 2),
                                vsync: this,
                              )..forward();
                              _animation = CurvedAnimation(
                                parent: _controller,
                                curve: Curves.fastOutSlowIn,
                              );
                            });
                          },
                          child: Text(
                            "ตั้งค่าบัญชีหลัก",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo),
                          ),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: GestureDetector(
                      child: Text("ขอเอกสารรายการเดินบัญชี",
                          style: TextStyle(color: Colors.blue, fontSize: 16)),
                      onTap: () {}),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "รายการเดินบัญชี",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 50,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: listMonth.length,
                  itemBuilder: (context, index) => Center(
                      child: GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeOut);
                          },
                          child: Text(
                            listMonth[index],
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ))),
                  onPageChanged: (index) {
                    setState(() {
                      indexOfMonth = index;
                    });
                  },
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Container(
                color: Colors.blue.withOpacity(0.08),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ถอนเงิน",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "-3,000.00",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("08 ${listMonth[indexOfMonth]} เวลา 16:15"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ฝากเงิน",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "20,800.00",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("05 ${listMonth[indexOfMonth]} เวลา 05:47"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
