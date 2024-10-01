import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class Clac extends StatefulWidget {
  const Clac({super.key});

  @override
  State<Clac> createState() => _ClacState();
}

class _ClacState extends State<Clac> {
  double finaltiptopay = 0;
  final TextEditingController _billcontroller = TextEditingController();
  final TextEditingController _amountToGetHerecontroller =
      TextEditingController();
  final TextEditingController _maxamounttopaycontroller =
      TextEditingController();
  final TextEditingController _overbudgetcontroller = TextEditingController();

  void checkTip() {
    setState(() {
      double billAmount = double.tryParse(_billcontroller.text) ?? 0;
      double fuelBurnt = double.tryParse(_amountToGetHerecontroller.text) ?? 0;
      double maxAmountToPay =
          double.tryParse(_maxamounttopaycontroller.text) ?? 0;
      double istthisoverbudget =
          double.tryParse(_overbudgetcontroller.text) ?? 0;
      finaltiptopay =
          ((billAmount * fuelBurnt) + maxAmountToPay * istthisoverbudget) /
              1000;
    });
  }

  void clearData() {
    setState(() {
      _billcontroller.text = "";
      _amountToGetHerecontroller.text = "";
      _maxamounttopaycontroller.text = "";
      _overbudgetcontroller.text = "";

      finaltiptopay = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pay The Tip",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 217, 103),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Hi Foodie,',
              style: TextStyle(fontSize: 20),
            ),
            const Text(
              "You got the bill, now pay the tip :) ",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Enter the total amount you got on the bill",
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _billcontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                prefixText: "INR ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Enter the amount you burnt to get here"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _amountToGetHerecontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                prefixText: "INR ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Enter the max amount you wish to pay as tip"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _maxamounttopaycontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                prefixText: "INR ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Enter the amount you thought this meal would cost"),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _overbudgetcontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                prefixText: "INR ",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    checkTip();
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero))),
                    alignment: Alignment.center,
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(20),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.amberAccent,
                    ),
                  ),
                  child: const Column(
                    children: [
                      Row(children: [
                        Icon(Icons.attach_money_sharp),
                        Text(
                          "Calculate",
                          style: TextStyle(color: Colors.black),
                        )
                      ]),
                    ],
                  )),
              ElevatedButton(
                onPressed: () {
                  clearData();
                },
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
                  alignment: Alignment.center,
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(20),
                  ),
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.amberAccent,
                  ),
                ),
                child: const Column(children: [
                  Row(
                    children: [
                      Icon(Icons.clear),
                      Text(
                        "Clear",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  )
                ]),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Final Amount - INR ${finaltiptopay.toString()}',
                style: TextStyle(fontSize: 20),
                textWidthBasis: TextWidthBasis.parent,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
