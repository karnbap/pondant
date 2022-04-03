import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pondant/pages/HomePage.dart';
import 'package:pondant/pages/qnaPage.dart';
import 'package:pondant/pages/tutorFeedPage.dart';

class Pondant extends StatefulWidget {
  const Pondant({Key? key}) : super(key: key);

  @override
  State<Pondant> createState() => _PondantState();
}

class _PondantState extends State<Pondant> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Hello 퐁당'),
      ),
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: const [
          HomePage(),
          TutorFeedPage(),
          QNAPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.blueGrey, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (newIndex) {
              print("selected newIndex : $newIndex");
              setState(() {
                currentIndex = newIndex;
              });
            },
            backgroundColor: Colors.blueGrey,
            selectedItemColor: Colors.blue[200], // 선택된 아이콘 색상
            unselectedItemColor: Colors.white, // 선택되지 않은 아이콘 색상
            showSelectedLabels: true, // 선택된 항목 label 숨기기
            showUnselectedLabels: true, // 선택되지 않은 항목 label 숨기기
            type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "홈",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_3),
                label: "튜터",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.question_circle),
                label: "Q&A",
              ),
              // BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            ],
          ),
        ),
      ),
    );
  }
}
