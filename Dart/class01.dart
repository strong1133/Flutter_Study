// 클래스 - 2021.11.16

class Person {
  String _name;
  int _age;

  String showInfo(Person person) {
    return "${person._name} 님의 나이는 ${person._age} 살 입니다.";
  }

  Person(String _name, int _age){
    this._name = _name; 
    this._age = _age;
  };
}
