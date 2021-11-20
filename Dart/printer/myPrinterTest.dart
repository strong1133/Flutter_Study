import 'myPrinter.dart';

void main(List<String> args) {
  MyPrinter myPrinter = new MyPrinter();

  myPrinter.getMachineName();

  myPrinter.turnOn();
  myPrinter.startPrint();

  myPrinter.enQueue("1번문서");
  myPrinter.enQueue("2번문서");
  myPrinter.enQueue("3번문서");
  myPrinter.enQueue("4번문서");

  int len = myPrinter.getSize();
  while (0 < len) {
    print('남은 문서는 ${myPrinter.getSize()} 건입니다.');
    print('${myPrinter.getTaskName()} 출력완료');
    myPrinter.deQueue();
    len = myPrinter.getSize();
  }

  myPrinter.endPrint();
  myPrinter.turnOff();
}
