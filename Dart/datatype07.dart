// 연산자 (산술) - 2021.11.15

void main() {
  int a = 5;
  double b = 2.2;

  String name = "정석진";

  if (b is int) {
    print("${b}는 int");
  } else {
    print("${b}는 int가 아님");
  }

  num n1 = b as num;
  print(n1);

  double d1 = n1 as double;
  print(d1);

  int f = d1 as int;
  print(f); // 에러발생!!
}
