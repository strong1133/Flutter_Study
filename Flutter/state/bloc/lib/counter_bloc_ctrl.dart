import 'dart:async';

class CounterBlocCtrl {
  int count = 0;

  late StreamController<int> streamController;

  CounterBlocCtrl() {
  //   streamController = StreamController<int>(); // 단일 구독 스트림 
    streamController = StreamController<int>.broadcast(); // 방송형 구독 스트림
  }

  Stream<int> get stream => streamController.stream;

  void increment() {
    count++;
    streamController.sink.add(count);
  }

  void decrement() {
    count--;
    streamController.sink.add(count);
  }

  void reset() {
    count = 0;
    streamController.sink.add(count);
  }

  void dispose() {
    streamController.close();
  }
}
