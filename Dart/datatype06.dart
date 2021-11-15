// 연산자 (산술) - 2021.11.15

void main() {
  int a = 5;
  int b = 2;

  print(a + b); // 7
  print(a * b); // 10
  print(a / b); // 2.5
  print(a ~/ b); // 2  => 몫만 가져오기
  print(a % b); // 1

  print(a++); // 5 => 프린트 후 증가
  print(++a); // 7 => 증가 후 프린트
}
