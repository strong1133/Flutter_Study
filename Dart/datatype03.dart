// 기본 자료형 (var) - 2021.11.15

void main() {
  var a = "정석진";
  var b = 2;

  var c;
  print(c); // null
  // var type은 NullSafety 때문에 ?를 붙이면 오히려 에러가 남.

  print(a); //정석진
  print(b); // 2
  c = 2.9;
  print(c); // 2.9
}
