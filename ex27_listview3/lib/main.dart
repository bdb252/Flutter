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
  late List<Person> persons;
  
  @override
  void initState () {
    super.initState();

    persons = [];
    for (int i=0; i<15; i++){
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: 
      /* 3. ListView.separated를 사용해서 Lazy하게 생성.
         아이템 사이에 구분자도 Lazy하게 생성 */
        ListView.separated(
          // 아이템 개수
          itemCount : persons.length,
          // 아이템 빌더 내에서 출력할 Tile 생성
          itemBuilder: (BuildContext context, int index)  {
            // Person인스턴스 외 추가데이터인 index 사용
            return PersonTile(persons[index], index);
          },
          // 구분선 표시
          separatorBuilder: (BuildContext context, int index){
            return const Divider(
              color: Colors.black,
              /** 구분선은 아래 속성에 따라 다른 결과를 툴력하므로 
               선택해서 사용한다. */
              // height: 1,
              thickness: 1.0,
            );
          },
        ),
      );
  }
}

// 데이터로 사용할 DTO 클래스 정의
class Person{
  int age;
  String name;
  bool isLeftHand;

  Person(this.age, this.name, this.isLeftHand);
}

// 리스트뷰를 구성할 PersonTile 클래스 정의
class PersonTile extends StatelessWidget{
  // 멤버변수와 생성자 정의
  final Person _person; //추가된 데이터
  final int index;
  // 추가데이터는 생성자를 통해 추가할 수 있다. 
  PersonTile(this._person, this.index);

  // 여기서 출력할 타일을 생성한다. 
  @override
  Widget build(BuildContext context) {
    /* 
    코드 추가 : ListTile에 배경색을 부여하고 싶다면 Ctrl+.으로 
    Container를 랩핑한 후 color속성을 부여하면 된다. */
    // 리스트 타일 생성
    return Container(
      color: Colors.amber[50],
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(_person.name),
        subtitle: Text("${_person.age}세"),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('추가 데이터 : $index');
        },
      ),
    );
  }
}