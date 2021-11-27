import 'dart:math';

void main() {
  grade();
}

void grade() {
  int score = Random().nextInt(100) + 1;
  print(score);

  if (score <= 50) {
    print("F학점 입니다.");
  } else if (score <= 69) {
    print("D학점 입니다.");
  } else if (score <= 79) {
    print("C학점 입니다.");
  } else if (score <= 89) {
    print("B학점 입니다.");
  } else {
    print("A학점 입니다.");
  }
}
