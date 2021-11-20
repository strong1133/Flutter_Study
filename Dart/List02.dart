// 배열, Map, Set - 2021.11.17

void main() {
  var items = [1, 2, 3];

  // spread 연산자
  var items2 = [...items, 4, 5];
  print(items);

  items.remove(items[0]);
  print(items);
}
