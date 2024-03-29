import 'dart:io'; //소켓, HTTP 통신 시 필요

void main() {
  showData();
}

void showData() {
  startTask();
  String account = accessData();
  fetchData(account);
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

String accessData() {
  String account;
  Duration time = Duration(seconds: 2);
  // sleep(time);
  Future.delayed(time, () {
    account = '1억 2천';
    print(account);
  });
  return account;
}

void fetchData(String account) {
  String info3 = '잔액은 $account 입니다.';
  print(info3);
}
