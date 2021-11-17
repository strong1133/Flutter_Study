// 배열, Map, Set - 2021.11.17

void main() {
  //List
  List<String> items = ['a', 'b', 'c', 'd'];
  var items02 = [1, 2, 3];
  var items03;
  items03 = [1, 2, 3, 4];

  print(items);
  print(items02);
  print(items03);

  //set
  var setItems01 = [1, 2, 3];
  var setItems02 = {1, 2, 3};

  print(setItems01);
  print(setItems02);

  //Map
  var mapItems01 = {
    'name': '정석진',
    'age': 27,
  }; // JSON
  print(mapItems01);
  print(mapItems01["name"]);
}
