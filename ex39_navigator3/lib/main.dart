import 'package:flutter/material.dart';
import 'page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      /* 최초 앱을 실행하여 Page1 인스턴스를 생성 후 화면에 렌더링할때
      '시작'이라는 파라미터를 전달한다. 즉, 생성자를 호출하여 인스턴스를 생성한다. */ 
      home: Page1(data: '시작',),
    );
  }
}