import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter 기본형'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 페이지 컨트롤러 생성
  final _pageController = PageController(
    initialPage: 0,
  );
  // 각 페이지의 페이지명으로 사용할 리스트
  List<String> pages = ['Page 1', 'Page 2', 'Page3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 페이지 상단에 바로가기 버튼 생성(고정)
              children: [
                ElevatedButton(
                  child: const Text('Page 1',
                  style: TextStyle(fontSize: 20)),
                  // 각 버튼을 누르면 람다형식으로 메서드 호출
                  onPressed: () => onClick(0),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('Page 2',
                  style: TextStyle(fontSize: 20)),
                  onPressed: () => onClick(1),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                  child: const Text('Page 3',
                  style: TextStyle(fontSize: 20)),
                  onPressed: () => onClick(2),
                ),
              ],
            ),
            // 상단에 고정된 텍스트
            Text('터치한 후 좌우로 Swipe 하세요', style: TextStyle(fontSize: 24),
            ),
            // 페이지를 전체 영역에 삽입
            Expanded(
              flex: 1,
              // 페이지뷰 추가
              child: PageView.builder(
                // 컨트롤러
                controller: _pageController,
                // 페이지 수
                itemCount: pages.length,
                // 각 함수를 호출하여 컨테이너 위젯을 반환받아 페이지 구성
                itemBuilder: (context, index){
                  return getPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClick(int index){
    if (_pageController.hasClients){
      //애니메이션 효과 없이 화면 전환
      // _pageController.jumpToPage(index); 

      // 설정된 시간만큼 애니메이션 효과 적용
      _pageController.animateToPage(
        index,
        // duration: const Duration(milliseconds: 1),
        // 적용 시간은 0.5초 이하로 설정하는 게 좋음
        duration: const Duration(milliseconds: 400),
        // 애니메이션 커브 설정
        curve: Curves.easeInOut,
      );
    }
  }

  // 각 페이지를 위젯으로 반환
  Widget getPage(int index){
    // 컨테이너를 생성한 후 반환한다.
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 인수로 전달받은 인덱스를 통해 페이지에 출력할 텍스트와 아이콘을
            지정한 후 컨테이너 위젯을 반환한다. */
            getIcon(index),
            Text(
              pages[index],
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(int index){
    if (index == 0){
      return Icon(
        Icons.camera_alt,
        color: Colors.red,
        size: 35,
      );
    }
    else if(index == 1){
      return Icon(
        Icons.add_circle,
         color: Colors.orange,
        size: 35,
      );
    }
    else{
      return Icon(
        Icons.star,
         color: Colors.indigo,
        size: 35,
      );
    }
  }

}
