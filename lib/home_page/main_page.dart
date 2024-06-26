import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zzero/category_page/bug_page.dart';
import 'package:zzero/category_page/category_page.dart';
import 'package:zzero/category_page/cheese_page.dart';
import 'package:zzero/category_page/cow_page.dart';
import 'package:zzero/category_page/fish_page.dart';
import 'package:zzero/category_page/pig_page.dart';
import 'package:zzero/components/Image_Slide.dart';
import 'package:zzero/components/search_box.dart';
import 'package:zzero/game_page/grow_cow.dart';
import '../category_page/chicken_page.dart';
import '../category_page/dairy_page.dart';
import '../category_page/protein_page.dart';
import '../components/category_tile.dart';
import '../my_page/my_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> imageUrls = [
    'assets/images/ad1.jpg', // 로컬 이미지 자산 경로 예시
    'assets/images/ad2.jpg',
    'assets/images/ad3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF5EA152),
          elevation: 0,
          title: Container(
            width: 110,
            height: 50, //로고 사이즈 임의 설정
            child: Image.asset('assets/images/moo.png',fit: BoxFit.contain,),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyPage()),
                  );
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0), // 구분선 높이
            child: Container(
              color: Color(0xFF5EA152), // 구분선 색상 설정해주기
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              SearchBox(
                controller: _searchController,
              ), //검색상자'
              SizedBox(
                height: 16.0,
              ),
              ImageSlide(imageUrls: imageUrls),
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        "카테고리",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "mainfont",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4, // 타일의 열 수 조정
                children: <Widget>[
                  CategoryTile(
                    imagePath: 'assets/images/cheese.png', //사진 넣어주기
                    title: '치즈',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheesePage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/dairy.png', //사진 넣어주기
                    title: '유제품',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DairyPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/protein.png', //사진 넣어주기
                    title: '프로틴',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProteinPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/bug.png', //사진 넣어주기
                    title: '곤충',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BugPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/chicken.png', //사진 넣어주기
                    title: '닭고기',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChickenPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/cow.png', //사진 넣어주기
                    title: '소고기',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BeefPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/pig.png', //사진 넣어주기
                    title: '돼지',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PorkPage()),
                      );
                    },
                  ),
                  CategoryTile(
                    imagePath: 'assets/images/fish.png', //사진 넣어주기
                    title: '어패류',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeafoodPage()),
                      );
                    },
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft, // 왼쪽 정렬
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(height:35,child: Image.asset('assets/images/hot.png')),
                      Text(
                        "랭킹",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: "mainfont",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // 박스 사이에 동일한 간격을 두기
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '1',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '풀무원 식물성 지구식단 런천미트 슬라이스',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '베지가든 떡갈비',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white),
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 11),
                          Text(
                            '3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 11),
                          Text(
                            '풀무원 식물성 지구식단 결이 다른 텐더 오리지널',
                            style: TextStyle(
                              color: Color(0xFF414141),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w300,
                              height: 0.09,
                              letterSpacing: -0.48,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>GrowCow())
            );
          },
          child: Icon(Icons.pets),  // 아이콘은 원하는 것으로 변경 가능
          backgroundColor: Color(0xFF5EA152),
        ),
      ),
    );
  }
}
