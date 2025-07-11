//Dart의 엔트리 포인트(출발점)
void main(){

  // Nullable & Non-Nullable
  // Non-Nullable : null값을 허용하지 않는 변수로 선언
  int num1 = 5;
  // Nullable : null값을 허용하는 변수로 선언
  int? num2 = 2;

  /*
  Dart에서는 모든 변수를 객체로 처리하므로 기본자료형 변수도 null값을
  대입할 수 있다.*/
  // null값을 허용하지 않는 변수이므로 null을 대입하면 에러 발생
  // num1 = null;    //에러 발생 : Non-Nullable
  num2 = null;      // ok : Nullable

  // 문자열인 경우에도 null에 대한 규칙은 동일하다.
  // str1은 null을 허용하지 않는 변수로 선언되었다.
  // String str1 = null;  //error : Non-Nullable
  String? str2 = null;    //ok : Nullable

  print("1 =============================================================");

  // *** Null Safety 규칙

  /* Non-Nullable 변수는 값 대입 없이 사용할 때 error.
  null로 자동초기화할 수 없으므로 에러가 발생한다. */
  // int a1;  print(a1);
  // Nullable 변수는 선언과 동시에 null로 초기화된다.
  int? a2; print(a2);

  // a2 변수는 nullable. 선언과 동시에 초기값이 null이 대입되어 초기화된다.
  // a1은 Non-Nullable. null로 자동 초기화할 수 없다.

  // var 타입에서의 Null Safety
  /*
  var는 입력되는 값에 따라 자료형을 유추하게 된다. 10으로 초기화했으므로
  int타입으로 유추한다. */
  var a3 = 10;      //int 타입으로 유추. Non-Nullable 변수이므로 null대입 불가
  // a3 = null

  var a4 = null;    //dynamic으로 유추
  var a5;           //dynamic으로 유추
  /*
  var로 선언시 Nullable과 Non-Nullable로 자동 유추가 된다. 따라서 ?를
  사용할 수 없다. */
  // var? a6 = null;    //error

  print("2 =============================================================");

  // *** Null Safety Operator

  int num3 = 5; //null을 허용하지 않는 변수
  int? num4;    //null을 허용하는 변수

  // ! : null check operator - runtime error throw
  // 변수 뒤에 !을 추가하면 이 변수 값이 null인 경우 runtime error가 발생

  num4 = 10;    //이 줄이 없으면 다음 줄 에러
  num3 = num4;  //컴파일 전 체크
  num3 = num4!; //실행 시 체크

  // ?, ?[] ?.. - null aware operator
  /*
  Non-nullable 변수이므로 null값을 가질 수 없다. 따라서 초기값이 없으면
  다음 줄에서 즉시 에러가 발생한다. */
  // String name;     // <-값이 대입되지 않고 사용되면 null일 수 있다.
  /*
  nullable로 선언되었으므로 null값을 가질 수 있다. 즉 null로 초기화할 수 있는 상태이다.*/
  String? name;
  // Null이 아닐때 메서드 실행
  name = name?.toLowerCase();


  // Null일때
  /*
  n42는 정수가 아니므로 변환시 예외가 발생하여 null이 반환된다. 이 경우
  삼항연산자에 의해 -1을 할당한다. */
  int val2 = int.tryParse('n42') ?? -1;
  print('val2 = $val2');
}
