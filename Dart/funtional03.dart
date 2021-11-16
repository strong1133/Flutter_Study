// 함수 (매개변수 선택) - 2021.11.16

// 선택형 매개변수 => 값을 넘겨도 되고 안넘겨도 됨.
void student(String name, {int? age}) {}

// 기본값 지정
void teacher(String name, {int age = 35}) {}
void main() {
  student("정석진"); //정석진
  student("정석진", age: 12); //정석진, 12

  teacher("홍슬기"); //홍슬기, 35
}
