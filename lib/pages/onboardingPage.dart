import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pondant/pages/pondant.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            // 첫 번째 페이지
            PageViewModel(
              title: "퐁당",
              body: "무슨 문구를 써야 좋을까요??",
              image: Padding(
                padding: EdgeInsets.all(32),
                child: Image.asset(
                  "assets/pondant_logo.png",
                  width: 200,
                ),
              ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            // 두 번째 페이지
            PageViewModel(
              title: "퐁당",
              body: "어떻게 꾸며야 할까요?",
              image: Image.asset(
                "assets/pondant_logo.png",
                width: 200,
              ),
              decoration: PageDecoration(
                titleTextStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                bodyTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
          next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
          done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () {
            // Done 클릭시 페이지 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pondant()),
            );
          },
        ),
      ),
    );
  }
}
