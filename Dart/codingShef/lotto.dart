import 'dart:math';

void main() {
  int tr = 0;
  while (true) {
    Set<int> lottoNum = lottoNumber('당첨');
    Set<int> myNum = lottoNumber('내 추첨');

    if (checkNum(lottoNum, myNum)) {
      print('당첨');
      print('$tr 번 만에 당첨');
      return;
    } else {
      tr++;
    }
  }
}

Set<int> lottoNumber(type) {
  var random = Random();

  Set<int> lottoList = {};
  var num;

  for (int i = 0; i < 6; i++) {
    num = random.nextInt(45) + 1;
    lottoList.add(num);
  }
  print('$type 번호');
  print(lottoList.toList());

  return lottoList;
}

bool checkNum(lottoNum, myNum) {
  bool flag = false;
  int match = 0;
  for (int ln in lottoNum) {
    for (int mn in myNum) {
      if (ln == mn) {
        match++;
      }
    }
  }
  print('당첨 번호 갯수 : $match');
  if (match >= 4) {
    flag = true;
  }
  return flag;
}
