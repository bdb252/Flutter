import 'package:flutter/material.dart';
// 디펜던시 설정으로 추가된 패키지 임포트
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'page_a1.dart';
import 'page_b1.dart';
import 'page_c1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 탭바 사용을 위한 컨트롤러 선언
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // 컨트롤러 인스턴스 생성
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    /**
    탭뷰 위젯을 사용하면 기본형과는 조금 다른 형태를 가지게 된다.
    플러터의 기본형은 appBar, body 프로퍼티를 사용하지만 여기서는 
    screens 속성에 출력할 화면을 지정한다. */
    return PersistentTabView(
      context,
      // 탭뷰 사용을 위한 컨트롤러
      controller: _controller,
      // 각 메뉴 클릭시 변경할 페이지 지정(메서드 호출)
      screens: _buildScreens(),
      // 탭뷰에 들어갈 아이콘 지정(메서드 호출)
      items: _navBarsItems(),
      // 옵션
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      // 아래 부분은 디플리케이션 되었음
      // hideNavigationBarWhenKeyboardShows: true,
      // popAllScreensOnTapOfSelectedTab: true,
      // popAcrionScreens: PopActionScreensType.all,
      // itemAnimationProperties: const itemAnimationProperties(
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: const ScreenTransitionAnimation(
      //   animateTabTransition: false,
      //   curve: Cures.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      // 탭뷰의 스타일 지정(pub.dev페이지 참조)
      navBarStyle: NavBarStyle.style1,
    );
  }

  // 탭뷰를 클릭했을때 이동할 페이지 선언
  List<Widget> _buildScreens(){
    // List로 만든 후 반환한다. 
    return [
      const PageA1(),
      const PageB1(),
      const PageC1(),
    ];
  }

  // 탭뷰의 버튼 생성 및 스타일 지정
  List<PersistentBottomNavBarItem> _navBarsItems(){
    return [
      PersistentBottomNavBarItem(
        // 아이콘
        icon: const Icon(Icons.home),
        // 타이틀 : 텍스트로 표현되는 메뉴명
        title: "Home",
        // 기본 컬러와 반전시의 컬러 지정
        activeColorPrimary: Colors.blue,
        // 비활성화 상태의 컬러
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: "Search",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Add",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
