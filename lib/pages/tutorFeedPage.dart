import 'package:flutter/material.dart';

class TutorFeedPage extends StatefulWidget {
  const TutorFeedPage({Key? key}) : super(key: key);

  @override
  State<TutorFeedPage> createState() => _TutorFeedPageState();
}

class _TutorFeedPageState extends State<TutorFeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('튜터 피드 페이지 입니다.'),
        ),
      ),
    );
  }
}
