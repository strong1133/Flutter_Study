class PersonDto {
  String? name;
  int? age;
  String? sex;

  set setSex(sex) => this.sex = sex;
  PersonDto(String name, int age, String sex) {
    this.name = name;
    this.age = age;
    this.sex = sex;
  }
}
