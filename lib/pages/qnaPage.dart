import 'package:flutter/material.dart';

class QNAPage extends StatefulWidget {
  const QNAPage({Key? key}) : super(key: key);

  @override
  State<QNAPage> createState() => _QNAPageState();
}

class _QNAPageState extends State<QNAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Center(
          child: Text('Q&A 페이지 입니다.'),
        ),
      ),
    );
  }
}
