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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 230, 225, 78),
        ),
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
          children : [
            Container(
              // 마진을 지정한 방향에만 적용 (좌, 상)
              margin: const EdgeInsets.only(left: 10, top: 10),
              // 패딩은 4방향 모두 적용
              padding: const EdgeInsets.all(0.0),
              color: Colors.yellow,
              // 가로크기는 미지정시 부모의 크기만큼 적용됨
              // width: 300,
              // 세로크기는 미지정시 자식(child)(글자)의 크기만큼 적용됨
              height: 100,
              // 정렬은 자식(child) 위젯에 적용됨
              alignment: Alignment.topLeft,
              child: const Text(
                '홍길동',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(80.0),
              alignment: Alignment.center,
              // 컨테이너의 모양을 결정하는 속성
              decoration: const BoxDecoration(
                // 박스 모양을 원으로 표현
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Text(
                '전우치',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(0.0),
              width: 400,
              height: 100,
              // 자식 위젯을 우측 하단으로 정렬
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                // 박스의 모양을 사각형으로 설정
                shape: BoxShape.rectangle,
                color: Colors.brown,
              ),
              child: const Text(
                '손오공',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            // 컨테이너 사이에 간격을 주기 위해 사이즈박스 위젯 사용
            const SizedBox(height: 5,),

            Container(
              // 이미지 버튼의 크기 지정
              width: 100.0,
              height: 40.0,
              // 컨테이너에 이미지를 데코레이션으로 삽입
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/300x100.png')
                ),
              ),
              // 텍스트버튼으로 마치 이미지 버튼과 같은 효과를 적용
              child: TextButton(
                /* 텍스트를 삽입하면 이미지 위에 보이게 되므로
                빈문자열 처리 */
                child: const Text('',),
                onPressed: () => _onClick(1),
              ),
            ),

            /* InkWell위젯 : Text와 같이 제스쳐 기능을 제공하지 않는 위젯을
            래핑하여 onTap 기능을 제공한다. 터치했을때 물결모양의 애니메이션 효과가
            발생한다. */
            Ink.image(
              image: const AssetImage('assets/images/300x100.png'),
              width: 100.0,
              height: 40.0,
              // fit: BoxFit.fill,
              child: InkWell(
                // child: Text('블라블라'),
                onTap: () => _onClick(2),
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  void _onClick(int num) {
    print('Hello~ $num');
  }

}
