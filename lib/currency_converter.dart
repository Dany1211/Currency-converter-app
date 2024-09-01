import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() {
    if (kDebugMode) {
      print("createState called");
    }
    return _CurrencyConverterState();
  }
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    setState(() {
      double enteredAmount = double.tryParse(textEditingController.text) ?? 0;
      result = enteredAmount * 84; // Convert USD to INR (1 USD = 84 INR)
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange,
        width: 6.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '₹${result.toStringAsFixed(2)}', // Display the converted amount in INR
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Please enter the amount in USD",
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // adding a button
            ElevatedButton(
              onPressed: convertCurrency, // Calls conversion function
              style: ElevatedButton.styleFrom(
                elevation: 15.0,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(170, 70),
              ),
              child: const Text(
                "Convert to INR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
