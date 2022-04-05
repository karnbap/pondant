import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pondant/pages/pondant.dart';

class OnboardingPage extends StatelessWidget {
  final PageController _pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () {
          //print('skipped');
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          print('done tapped');
        },
        onBoardData: onBoardData,
        imageWidth: 300,
        imageHeight: double.infinity,

        titleStyles: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.blueAccent,
          activeColor: Colors.blueAccent,
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Pondant()));
            // print('skipButton pressed');
          },
          child: const Text(
            "Skip",
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(context, state),
              child: Container(
                width: 150,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Colors.blueGrey, Colors.blueAccent],
                  ),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onNextTap(BuildContext context, OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Pondant()));
      //onDone();
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "퐁당에서 한국인 튜터를 찾아보세요!(불or영)",
    description: "",
    imgUrl: 'assets/pondant_logo.png',
  ),
  const OnBoardModel(
    title: "회원가입 후 필터에서 여러분이 좋아하는 단어를 선택주세요.",
    description: " ",
    imgUrl: 'assets/pondant_logo.png',
  ),
  const OnBoardModel(
    title: "여러분과 같은 취향을 가진 원어민 튜터에게 연락해보세요.",
    description: "",
    imgUrl: 'assets/pondant_logo.png',
  ),
];

// class OnboardingPage extends StatelessWidget {
//   const OnboardingPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: IntroductionScreen(
//           pages: [
//             // 첫 번째 페이지
//             PageViewModel(
//               title: "퐁당",
//               body: "무슨 문구를 써야 좋을까요??",
//               image: Padding(
//                 padding: EdgeInsets.all(32),
//                 child: Image.asset(
//                   "assets/pondant_logo.png",
//                   width: 200,
//                 ),
//               ),
//               decoration: PageDecoration(
//                 titleTextStyle: TextStyle(
//                   color: Colors.blueAccent,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 bodyTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             // 두 번째 페이지
//             PageViewModel(
//               title: "퐁당",
//               body: "어떻게 꾸며야 할까요?",
//               image: Image.asset(
//                 "assets/pondant_logo.png",
//                 width: 200,
//               ),
//               decoration: PageDecoration(
//                 titleTextStyle: TextStyle(
//                   color: Colors.blueAccent,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 bodyTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//           next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
//           done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
//           onDone: () {
//             // Done 클릭시 페이지 이동
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Pondant()),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
