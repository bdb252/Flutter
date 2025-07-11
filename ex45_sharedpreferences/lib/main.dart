import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

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

  // SharedPreferences 인스턴스에 저장할 데이터 생성
  late int counter = 0;
  late SharedPreferences prefs;

  // 앱 최초 실행시 딱 한번 호출하여 저장된 값을 얻어온다. 
  @override
  void initState(){
    super.initState();
    getSharedPreferences();
  }

  /**
  이 클래스는 싱글톤 디자인패턴으로 제작되어있어 getInstance()를 통해
  인스턴스의 참조값을 얻어온다. */
  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // 기존에 저장된 값이 없으면 0을 할당한다. 
    setState(() {
      counter = (prefs.getInt("counter") ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                heroTag: "빼기",
                child: Icon(Icons.remove),
                onPressed: () {
                  // 숫자를 차감한 후 리렌더링한다.
                  setState(() {
                    counter--;
                  });
                  // 인스턴스에 값을 저장한다. 
                  prefs.setInt("counter", counter);
                },
              ),
            ),
            Text("Shared preferences value: "),
            Text(
              "$counter",
              // ${counter.toString()},
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                heroTag: "더하기",
                child: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                  prefs.setInt("counter", counter);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
