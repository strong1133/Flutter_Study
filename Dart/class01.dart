// 클래스 - 2021.11.16

class Person {
  String? _name;
  int? _age;

  String? get name => this._name;

  set name(String? value) => this._name = value;

  get age => this._age;

  set age(value) => this._age = value;

  // 기본 생성자
  Person() {}

  // 이름과 나이를 매개변수로 받는 생성자
  Person.gen(String name, int age) {
    this._name = name;
    this._age = age;
  }

  String showInfo(Person person) {
    return "${person._name}님의 나이는 ${person._age}살 입니다.";
  }
}

void main() {
  Person person = new Person.gen("정석진", 12);
  print(person.showInfo(person));
  person.name = "홍슬기";
  print(person.name);
}
