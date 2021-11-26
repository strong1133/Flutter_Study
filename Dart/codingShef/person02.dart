class Person {
  String? name;
  int? age;
  String? sex;

  @override
  String toString() {
    var res = "이름: ${name}, 나이: ${age}, 성별: ${sex}";
    print(res);
    return res;
  }
}

void main() {
  Person p1 = new Person()
    ..name = "정석진"
    ..age = 26
    ..sex = "남자"
    ..toString();

  Person p2 = new Person();
  p2.name = "홍슬기";
  p2.age = 26;
  p2.sex = "여자";
  p2.toString();
}
