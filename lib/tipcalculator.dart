import 'package:flutter/material.dart';

class TiPCalV2 extends StatefulWidget {
  const TiPCalV2({super.key});

  @override
  State<TiPCalV2> createState() => _TiPCalV2State();
}

class _TiPCalV2State extends State<TiPCalV2> {
  TextEditingController billAmnt = TextEditingController();
  //TextEditingController cstmTip = TextEditingController();
  dynamic totalPayPerPerson = "000";
  var selectedPer = 0;
  var totalSplit = 1;
  var totalTip = 00.0;
  dynamic totalPay = 00.0;
  dynamic ttlTipPerPerson = 0.0;
  bool isAmntClicked = false;
  bool isCstmClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SizedBox(
        height: MediaQuery.of(context).size.height*2,
        width: double.infinity,
        child: SafeArea(
          child: Stack(
            children: [
              Image.network(
                "https://cdn.statusqueen.com/mobilewallpaper/thumbnail/city-940.jpg",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.63,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 38, 97, 99),
                      backgroundBlendMode: BlendMode.modulate,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(40, 60),
                          topRight: Radius.elliptical(40, 60)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 30,
                          child: Text(
                            "BILL",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 220,
                          child: InkWell(
                            onTap: () {
                              isAmntClicked = true;
                              setState(() {});
                            },
                            child: Container(
                                height: 30,
                                width: 100,
                                color: isAmntClicked
                                    ? Colors.white
                                    : Colors.transparent,
                                child: isAmntClicked
                                    ? TextField(
                                  controller: billAmnt,
                                  onChanged: (value) {
                                    calculator();
                                  },
                                  decoration: InputDecoration(
                                    //  fillColor: Colors.white,
                                    //label: Text("Bill"),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(5),
                                    //   borderSide: BorderSide(color: Colors.cyan),
                                    // ),
                                  ),
                                )
                                    : Center(
                                    child: Text(
                                      "${billAmnt.text}",
                                      style: TextStyle(
                                          color: Color(0xff02cabd),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ))),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          child: Container(
                            height: 140,
                            width: 300,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(249, 36, 237, 227),
                                  Color.fromARGB(255, 14, 68, 65),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 30,
                                  left: 30,
                                  child: Text(
                                    "Tip",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                                Positioned(
                                  top: 90,
                                  left: 30,
                                  child: Text(
                                    "People",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 180,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 93, 77),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (selectedPer >= 1) {
                                      selectedPer--;
                                      isAmntClicked = false;
                                      calculator();
                                    }
                                  },
                                  child: Text(
                                    "${selectedPer - 1}%",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    "$selectedPer%",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    selectedPer++;
                                    isAmntClicked = false;
                                    calculator();
                                  },
                                  child: Text(
                                    "${selectedPer + 1}%",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 165,
                          left: 180,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 20, 93, 77),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (totalSplit >= 2) {
                                      totalSplit--;
                                      isAmntClicked = false;
                                      calculator();
                                    }
                                  },
                                  child: Text(
                                    "${totalSplit - 1}",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 20),
                                  ),
                                ),
                                Text(
                                  "$totalSplit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                InkWell(
                                  onTap: () {
                                    totalSplit++;
                                    isAmntClicked = false;
                                    calculator();
                                  },
                                  child: Text(
                                    "${totalSplit + 1}",
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 230,
                          // left: 30,
                          child: Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.cyan,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Tip amount",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "$totalTip",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff02cabd),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Tip per person",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      "$ttlTipPerPerson",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff02cabd),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Total per person",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      "$totalPayPerPerson",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff02cabd),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 370,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            //  color: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Bill total",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                                Text(
                                  "$totalPay",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff02cabd),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculator() {
    // var ttlBill = int.parse(totalBill.text);

    if (billAmnt.text.isNotEmpty) {
      var ttlBill = int.parse(billAmnt.text);

      totalTip = ttlBill * selectedPer / 100;

      totalPay = ttlBill + totalTip;
      ttlTipPerPerson = (totalTip / totalSplit);
      ttlTipPerPerson = ttlTipPerPerson.toStringAsFixed(2);
      totalPayPerPerson = totalPay / totalSplit;
      totalPayPerPerson = totalPayPerPerson.toStringAsFixed(2);
    }

    setState(() {});
  }
}