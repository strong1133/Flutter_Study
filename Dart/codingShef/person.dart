import 'person_dto.dart';

class Person {
  String? name;
  int? age;
  String? sex;

  Person(String name, int age, String sex) {
    this.name = name;
    this.age = age;
    this.sex = sex;
  }

  Person.getDto(PersonDto personDto) {
    this.name = personDto.name;
    this.age = personDto.age;
    this.sex = personDto.sex;
  }

  @override
  String toString() {
    var res = "이름: ${name}, 나이: ${age}, 성별: ${sex}";
    return res;
  }
}

void main() {
  Person p1 = new Person("정석진", 26, "남자");

  PersonDto pp = new PersonDto("홍슬기", 26, "여자");

  Person p2 = Person.getDto(pp);

  print(p1.toString());
  print(p2.toString());
}
