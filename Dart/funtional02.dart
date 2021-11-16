// 함수 (익명, 람다) - 2021.11.16

void main() {
  int number = 10;

  print(res(number));
  print(resLamda(number));
}

// 익명함수
var res = (number) {
  return number ~/ 2;
};

// 람다
resLamda(number) => number * 2;
