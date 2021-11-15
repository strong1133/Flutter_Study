// 기본 자료형 (String) - 2021.11.15

void main() {
  //문자열
  String name = '정석진';

  String? name2;
  print(name2); //null
  // -> Null_Safety 적용 중일 때는 에러가 남.
  // Null_Safety 에서 null을 허용하기 위해선,
  // String? name2; -> ?를 붙여서 선언 하면 됨.
  name2 = "홍슬기";

  print(name); //정석진
  print(name2); //홍슬기
}
