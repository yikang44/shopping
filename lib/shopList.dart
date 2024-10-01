import 'package:flutter/material.dart';

class shoplist extends StatefulWidget {
  const shoplist({super.key});

  @override
  State<shoplist> createState() => _shoplistState();
}

class _shoplistState extends State<shoplist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
    );
  }
}
