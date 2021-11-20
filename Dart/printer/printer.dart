import 'machine.dart';

class Printer extends Machine {
  void startPrint() {
    print("출력을 시작합니다.");
  }

  void endPrint() {
    print("출력을 종료합니다.");
  }

  @override
  getMachineName() {
    print("장치 이름은 프린터");
  }
}
