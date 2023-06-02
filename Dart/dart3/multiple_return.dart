class Aniaml {
  int age;

  Aniaml({required this.age});
}

class Human extends Aniaml {
  String name;
  Human({required this.name, required super.age});
}

void main(List<String> args) {
  Human human1 = Human(name: "정석진", age: 28);

  var (String nn, int aa) = getInfo(human: human1);

  print(getInfo(human: human1).runtimeType);
  print(getInfo(human: human1) is (String, int));
  print(getInfo(human: human1) is (String, int));
  print(getInfo(human: human1).$1);
  print(getInfo(human: human1).$2);

  print(nn);
  print(aa);

  Map<String, dynamic> json = {
    'user': ['Lily', 13]
  };

  switch (json) {
    case {'user': [String name, int age]}:
      print('User $name is $age years old.');
    default:
      throw 'Unknown message';
  }
}

(String, int) getInfo({required Human human}) {
  return (human.name, human.age);
}
