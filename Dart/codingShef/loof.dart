void main() {
  for (int i = 0; i < 6; i++) {
    print('$i 번째 실행');
  }

  List<String> rainbow = ['빨', '주', '노', '초', '파', '남', '보'];

  for (int i = 0; i < rainbow.length; i++) {
    print(rainbow[i]);
  }

  for (String v in rainbow) {
    print(v);
  }

  rainbow.forEach((v) {
    print(v);
  });
}
