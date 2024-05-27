import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift Money',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DonateMoneyPage(),
    );
  }
}

class DonateMoneyPage extends StatefulWidget {
  const DonateMoneyPage({Key? key}) : super(key: key);

  @override
  State<DonateMoneyPage> createState() => _DonateMoneyPage();
}

class _DonateMoneyPage extends State<DonateMoneyPage> {
  Razorpay? _razorpay;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: 'SUCCESS PAYMENT: ${response.paymentId}', timeInSecForIosWeb: 4);
        _reset();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE: ${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
        _reset();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "ExternalWallet is :${response.walletName}", timeInSecForIosWeb: 4);
        _reset();
  }

  void makePayment() async {
    var options = {
      'key': 'rzp_test_CZYobo2wVAc088',
      'amount': int.parse(_amountController.text) * 100, // amount has to be in paise
      'name': _nameController.text,
      'description': 'Donation',
      'prefill': {'contact': _phoneController.text, 'email': _emailController.text}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _sendDonation() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      makePayment();
    }
  }

  void _reset() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gift Money'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  // Pattern pattern = r'^[A-Za-z ]+$';
                  RegExp regex = new RegExp(r'[A-Za-z ]+$');
                  if (!regex.hasMatch(value!))
                    return 'Invalid name';
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value) {
                  // Pattern pattern = r'^[0-9]+$';
                  RegExp regex = new RegExp(r'^[0-9]+$');
                  if (!regex.hasMatch(value!))
                    return 'Invalid phone number';
                  else
                    return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                validator: (value) {
               //   Pattern pattern = r'^[0-9]+$';
                  RegExp regex = new RegExp(r'^[0-9]+$');
                  if (!regex.hasMatch(value!))
                    return 'Invalid amount';
                  else
                    return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendDonation,
                child: const Text('Send Donation'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _reset,
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay?.clear(); // this will remove all listeners
  }
}

// void main() {
//   runApp(MyApp());
// }