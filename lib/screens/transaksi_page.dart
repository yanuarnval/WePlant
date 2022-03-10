import 'package:flutter/material.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';

class TransaksiPage extends StatefulWidget {
  final String img;

  const TransaksiPage({Key? key, required this.img}) : super(key: key);

  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gopay.png',
                width: 152,
                height: 50,
              ),
              Image.network(
                widget.img,
                width: 225,
                height: 225,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
