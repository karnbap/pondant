import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'package:smart_grid_view/smart_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: Image.asset(
        //   'assets/pondant.png',
        //   fit: BoxFit.cover,
        // ),
        title: Text(
          "Pondant",
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search, color: Colors.blueGrey),
            onPressed: () {
              print("검색창 클릭 됨");
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell, color: Colors.blueGrey),
            onPressed: () {
              print("알림창 클릭 됨");
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 2,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(height: 32),

                    /// 튜터 추천 Title
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              // 공통 스타일
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "OOO",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(text: "님에게 꼭 맞는 튜터 추천"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    /// 추천 튜터 리스트
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // 횡스크롤
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 80,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/icn_profile_24px.png'),
                                ),
                                Text('사진넣기'),
                                SizedBox(height: 6),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              // 공통 스타일
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                TextSpan(text: "튜터"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    //   SizedBox(height: 20),
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: SmartGridView(
                    //       tileWidth: 128,
                    //       tileHeight: 168,
                    //       children: List.generate(
                    //           80,
                    //           (index) => Card(
                    //                 child: GridTile(
                    //                   child: Text('tile #$index'),
                    //                 ),
                    //               )),
                    //     ),
                    //   )
                  ],
                ),
              ),
            ],
          ),

          /// Message
          Positioned(
            bottom: 18,
            right: 24,
            child: GestureDetector(
              onTap: () => print("Message 클릭 됨"),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(64),
                ),
                child: Row(
                  children: [
                    Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
