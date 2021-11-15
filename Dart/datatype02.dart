// 기본 자료형 (숫자) - 2021.11.15

void main() {
  int a = 1;
  double b = 2.0;

  num c = a;

  print(c); // 1
  c = b;

  print(a); // 1
  print(b); // 2.0
  print(c); // 2.0

  int? d;
  print(d); // null
  d = 8;
  print(d); // 8
}
